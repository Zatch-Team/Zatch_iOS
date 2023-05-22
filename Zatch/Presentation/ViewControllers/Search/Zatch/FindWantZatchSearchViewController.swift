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
    private let viewModel = FindWantZatchSearchViewModel()
    
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

        let input = FindWantZatchSearchViewModel.Input(productNameTextField: mainView.searchTextFieldFrame.textField.rx.text.orEmpty.asObservable())
    
        
        let output = viewModel.transform(input)
        
        //TODO: editingChanged와 editingDidBegin 조합해서 observable 방출시키고 싶다
        mainView.searchTextFieldFrame.textField.rx.controlEvent([.editingChanged]).asObservable()
            .subscribe(onNext: {
                self.currentSelectCell = nil
            }).disposed(by: disposeBag)
        
        output.searchProduct
            .drive(onNext: { [weak self] in
                self?.mainView.searchTextFieldFrame.textField.text = $0
            }).disposed(by: disposeBag)
        
    }
    
    @objc private func willMoveSearchResultViewController(){
        self.navigationController?.pushViewController(ZatchSearchResultViewController(), animated: true)
    }
    
    private func setFlexibleSearchAttribute(){
        mainView.myProductNameLabel.text = "???"
        mainView.myProductNameLabel.textColor = .zatchYellow
        mainView.nextButton.setTitle("유연한 탐색", for: .normal)
    }
    
}

extension FindWantZatchSearchViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionView == mainView.popularKeywordCollectionView ? viewModel.getPopularKeywordsCount() : viewModel.getLookingForZatchCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let title = getCellTitle(of: collectionView, index: indexPath.row)
        return collectionView.dequeueReusableCell(for: indexPath, cellType: SearchTagCollectionViewCell.self).then{
            $0.setTitle(title)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let title = getCellTitle(of: collectionView, index: indexPath.row)
        return SearchTagCollectionViewCell.estimatedSize(of: title)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if(mainView.searchTextFieldFrame.textField.isFocused){
            mainView.searchTextFieldFrame.textField.resignFirstResponder()
        }

        if let willSelectCell = collectionView.cellForItem(at: indexPath, cellType: SearchTagCollectionViewCell.self){
            if(currentSelectCell == willSelectCell){
                currentSelectCell = nil
                viewModel.deselectCell()
                return
            }
            currentSelectCell = willSelectCell
            collectionView == mainView.popularKeywordCollectionView ? viewModel.selectPopularKeyword(at: indexPath.row) : viewModel.selectLookingForZatch(at: indexPath.row)
        }
    }
    
    private func getCellTitle(of collectionView: UICollectionView, index: Int) -> String{
        collectionView == mainView.popularKeywordCollectionView ? viewModel.getPopularKeyword(at: index) : viewModel.getLookingForZatch(at: index)
    }
}

