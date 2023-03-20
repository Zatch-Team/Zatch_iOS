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
        
        output.exchangeProductName
            .drive{ [weak self] in
                self?.mainView.searchTextFieldFrame.textField.text = $0
            }.disposed(by: disposeBag)
        
        output.canMoveNext
            .drive(mainView.nextButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        //cell 클릭으로 데이터 설정했다가 textField 입력 바꾸는 경우 > cell isSelectState toggle 시켜야
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
        SearchTagCollectionViewCell.getEstimatedSize(of: viewModel.getMyZatch(at: indexPath.row))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath, cellType: SearchTagCollectionViewCell.self) else { return }
        cell.isSelectState ? viewModel.willDeselectMyZatch() : viewModel.willSelectZatch(at: indexPath.row)
        cell.isSelectState.toggle()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath, cellType: SearchTagCollectionViewCell.self){
            cell.isSelectState = false
        }
    }
}

