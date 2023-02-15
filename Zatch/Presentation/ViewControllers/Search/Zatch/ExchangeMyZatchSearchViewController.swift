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
    
    private let zatches = ["몰랑이 피규어","매일우유 250ml","콜드브루 60ml","예시가 있다면","이렇게 들어가야","해요요요요","해요요요","해요요","해요","해","아아앙아ㅏ앙아아앙아아"]
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
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        mainView.nextButton.addTarget(self, action: #selector(nextButtonClick), for: .touchUpInside)
        mainView.skipButton.addTarget(self, action: #selector(skipBtnDidClicked), for: .touchUpInside)
    }
    
    override func bind() {
        
        let input = ExchangeMyZatchSearchViewModel.Input(exchangeProductName: mainView.searchTextFieldFrame.textField.rx.text.orEmpty.asObservable())
        let output = viewModel.transform(input)
        
        output.exchangeProductName
            .drive{
                self.searchManager.myZatch = $0
            }.disposed(by: disposeBag)
        
        output.canMoveNext
            .drive(
                self.mainView.nextButton.rx.isEnabled
            ).disposed(by: disposeBag)
    }
    
    //MARK: Action
    
    @objc func nextButtonClick(){
        let vc = FindWantZatchSearchViewController(productName: searchManager.myZatch)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func skipBtnDidClicked(){
        searchManager.myZatch = ""
        let vc = FindWantZatchSearchViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ExchangeMyZatchSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return zatches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: SearchTagCollectionViewCell.self).then{
            $0.setTitle(zatches[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return SearchTagCollectionViewCell.getEstimatedSize(title: zatches[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath, cellType: SearchTagCollectionViewCell.self) else { return }
        mainView.searchTextFieldFrame.textField.text = cell.isSelectState ? "" : zatches[indexPath.row]
        mainView.searchTextFieldFrame.textField.sendActions(for: .valueChanged)
        cell.isSelectState.toggle()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath, cellType: SearchTagCollectionViewCell.self){
            cell.isSelectState = false
        }
    }
}

