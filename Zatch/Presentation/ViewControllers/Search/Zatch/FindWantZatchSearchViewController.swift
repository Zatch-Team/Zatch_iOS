//
//  SecondSearchViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/01.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class FindWantZatchSearchViewController: BaseViewController<BaseHeaderView, FindWantZatchSearchView> {
    
    @frozen
    enum SearchKeywordType: Int{
        case popular = 100
        case want = 200
    }
    
    //MARK: - Properties
    private var currentSelectCell: SearchTagCollectionViewCell?{
        willSet{
            currentSelectCell?.isSelectState = false
        }
        didSet{
            currentSelectCell?.isSelectState = true
        }
    }
    private let viewModel: any FindWantZatchViewModelInterface = FindWantZatchSearchViewModel()
    
    init(){
        super.init(headerView: BaseHeaderView(), mainView: FindWantZatchSearchView())
        setFlexibleSearchAttribute()
    }
    
    init(productName: String){
        super.init(headerView: BaseHeaderView(), mainView: FindWantZatchSearchView())
        mainView.myProductNameLabel.text = productName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    override func initialize() {
        super.initialize()
        addBtnTarget()
        setCollectionViewDelegate()
        attachCollectionViewTag()
    }
    
    private func addBtnTarget(){
        mainView.nextButton.addTarget(self, action: #selector(willMoveSearchResultViewController), for: .touchUpInside)
    }
    
    private func setCollectionViewDelegate(){
        mainView.popularKeywordCollectionView.initializeDelegate(self)
        mainView.lookingForCollectionView.initializeDelegate(self)
    }
    
    private func attachCollectionViewTag(){
        mainView.popularKeywordCollectionView.tag = SearchKeywordType.popular.rawValue
        mainView.lookingForCollectionView.tag = SearchKeywordType.want.rawValue
    }
    
    override func bind() {
        
        bindReloadData()
        
        guard let viewModel = viewModel as? FindWantZatchSearchViewModel else { return }

        let input = FindWantZatchSearchViewModel.Input(productNameTextField: mainView.searchTextFieldFrame.textField.rx.text.orEmpty.asObservable())
    
        
        let output = viewModel.transform(input)
        
        //TODO: editingChanged와 editingDidBegin 조합해서 observable 방출시키고 싶다
        mainView.searchTextFieldFrame.textField.rx.controlEvent([.editingChanged])
            .asObservable()
            .subscribe(onNext: {
                self.currentSelectCell = nil
            }).disposed(by: disposeBag)
        
        output.searchProduct
            .drive(mainView.searchTextFieldFrame.textField.rx.text)
            .disposed(by: disposeBag)
    }
    
    private func bindReloadData(){
        viewModel.reloadPopularData
            .subscribe{ [weak self] _ in
                self?.mainView.popularKeywordCollectionView.reloadData()
            }.disposed(by: disposeBag)
        
        viewModel.reloadLookingForData
            .subscribe{ [weak self] _ in
                self?.mainView.lookingForCollectionView.reloadData()
            }.disposed(by: disposeBag)
    }
    
    @objc private func willMoveSearchResultViewController(){
        navigationController?.pushViewController(ZatchSearchResultViewController(), animated: true)
    }
    
    private func setFlexibleSearchAttribute(){
        mainView.myProductNameLabel.text = "???"
        mainView.myProductNameLabel.textColor = .zatchYellow
        mainView.nextButton.setTitle("유연한 탐색", for: .normal)
    }
    
}

extension FindWantZatchSearchViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate, UICollectionViewDataSource{
    
    private func getCollectionViewType(tag: Int) -> SearchKeywordType{
        guard let type = SearchKeywordType(rawValue: tag) else { fatalError() }
        return type
    }
    
    private func getKeywordTitle(tag: Int, index: Int) -> String{
        switch getCollectionViewType(tag: tag) {
        case .popular:      return viewModel.popularKeywords[index].keyword
        case .want:         return viewModel.lookingForZatches[index]
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch getCollectionViewType(tag: collectionView.tag) {
        case .popular:      return viewModel.popularKeywords.count
        case .want:         return viewModel.lookingForZatches.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let title = getKeywordTitle(tag: collectionView.tag, index: indexPath.row)
        return collectionView.dequeueReusableCell(for: indexPath, cellType: SearchTagCollectionViewCell.self).then{
            $0.setTitle(title)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let title = getKeywordTitle(tag: collectionView.tag, index: indexPath.row)
        return SearchTagCollectionViewCell.estimatedSize(of: title)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if mainView.searchTextFieldFrame.textField.isFocused {
            mainView.searchTextFieldFrame.textField.resignFirstResponder()
        }

        if let willSelectCell = collectionView.cellForItem(at: indexPath, cellType: SearchTagCollectionViewCell.self){
            if currentSelectCell == willSelectCell {
                currentSelectCell = nil
                viewModel.productName.accept("")
            } else {
                currentSelectCell = willSelectCell
                viewModel.productName.accept(getKeywordTitle(tag: collectionView.tag, index: indexPath.row))
            }
        }
    }
}

