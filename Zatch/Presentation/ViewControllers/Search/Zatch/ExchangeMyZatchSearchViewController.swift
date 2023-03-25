//
//  ExchangeMyZatchSearchViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/04/30.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class ExchangeMyZatchSearchViewController: BaseViewController<BaseHeaderView, ExchangeMyZatchSearchView>{
    
    //MARK: - Properties
    
    private var selectedRegisterCell: SearchTagCollectionViewCell?{
        willSet{
            selectedRegisterCell?.isSelectState = false
        }
        didSet{
            selectedRegisterCell?.isSelectState = true
        }
    }
    
    private let viewModel = ExchangeMyZatchSearchViewModel()
    private let searchManager = ZatchSearchRequestManager.shared
    
    //MARK: - LifeCycle

    init(){
        super.init(headerView: BaseHeaderView(), mainView: ExchangeMyZatchSearchView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize(){
        
        super.initialize()
        
        mainView.collectionView.initializeDelegate(self)
        
        mainView.nextButton.addTarget(self, action: #selector(moveNextButtonDidTapped), for: .touchUpInside)
        mainView.skipButton.addTarget(self, action: #selector(skipBtnDidClicked), for: .touchUpInside)
    }

    override func bind() {
        
        let input = ExchangeMyZatchSearchViewModel.Input(exchangeProductByTextField: mainView.searchTextFieldFrame.textField.rx.text.orEmpty.asObservable())
        let output = viewModel.transform(input)
        
        //TODO: 돋보기 비활성화 > black10 설정
        
        output.exchangeProductName
            .drive{ [weak self] in
                self?.mainView.searchTextFieldFrame.textField.text = $0
            }.disposed(by: disposeBag)
        
        output.canMoveNext
            .drive(mainView.nextButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        mainView.searchTextFieldFrame.textField.rx.controlEvent([.editingChanged]).asObservable()
            .subscribe(onNext: {
                self.selectedRegisterCell = nil
            }).disposed(by: disposeBag)
    }
    
    //MARK: Action
    
    @objc private func moveNextButtonDidTapped(){
        let vc = FindWantZatchSearchViewController(productName: searchManager.myProduct)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func skipBtnDidClicked(){
        viewModel.willSkipSelectMyZatch()
        let vc = FindWantZatchSearchViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ExchangeMyZatchSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getMyZatchesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(for: indexPath, cellType: SearchTagCollectionViewCell.self).then{
            $0.setTitle(viewModel.getMyZatch(at: indexPath.row))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        SearchTagCollectionViewCell.estimatedSize(of: viewModel.getMyZatch(at: indexPath.row))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath, cellType: SearchTagCollectionViewCell.self){
            if(selectedRegisterCell == cell){
                selectedRegisterCell = nil
                viewModel.willDeselectMyZatch()
            }else{
                selectedRegisterCell = cell
                viewModel.willSelectZatch(at: indexPath.row)
            }
        }
    }
}

