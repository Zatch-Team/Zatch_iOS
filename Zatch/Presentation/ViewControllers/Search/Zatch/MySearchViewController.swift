//
//  SearchViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/04/30.
//

import UIKit
import SnapKit

class MySearchViewController: BaseViewController<BaseHeaderView, MySearchView>{
    
    //MARK: - Properties
    
    let myZatchData: [String] = ["몰랑이 피규어","매일우유 250ml","콜드브루 60ml","예시가 있다면","이렇게 들어가야","해요요요요","해요요요","해요요","해요","해","아아앙아ㅏ앙아아앙아아"]
    
    var currentSelect: Int = -1
    
    //MARK: - LifeCycle

    init(){
        super.init(headerView: BaseHeaderView(), mainView: MySearchView())
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
    
    //MARK: Action
    
    @objc func nextButtonClick(){
        let product = mainView.selectTextField.text
        
        if(product == "" || product == nil){
            skipBtnDidClicked()
        }else{
            let vc = FindSearchViewController()
            vc.mainView.myLabel.text = product
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func skipBtnDidClicked(){
        
        let vc = FindSearchViewController()
        
        vc.mainView.myLabel.text = "???"
        vc.mainView.myLabel.textColor = .zatchYellow
        vc.mainView.nextButton.setTitle("유연한 탐색", for: .normal)

        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MySearchViewController: CellDelegate{
    
    func cellDidSelected(_ indexPath: IndexPath){
        if let currentTag = mainView.collectionView.cellForItem(at: [0, currentSelect]) as? MySearchTagCollectionViewCell {
            currentTag.setBtnInitState()
        }
        
        if(currentSelect == indexPath.row){
            currentSelect = -1
            mainView.selectTextField.text = ""
        }else{
            if let newTag = mainView.collectionView.cellForItem(at: indexPath) as? MySearchTagCollectionViewCell{
                newTag.setBtnSelectedState()
                mainView.selectTextField.text = myZatchData[indexPath.row]
                currentSelect = indexPath.row
            }
        }
    }
    
    func cellDidSelected(_ cell: UICollectionViewCell) { }
}

extension MySearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myZatchData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MySearchTagCollectionViewCell.cellIdentifier,
                                                            for: indexPath)
                as? MySearchTagCollectionViewCell else{ fatalError() }
        
        cell.delegate = self
        cell.selectBtn.setTitle(myZatchData[indexPath.row], for: .normal)
        cell.setBtnInitState()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let tmpLabel = UILabel().then{
            $0.text = myZatchData[indexPath.row]
            $0.numberOfLines = 1
            $0.sizeToFit()
        }

        let width = tmpLabel.frame.size.width
        
        let adjustWidth = myZatchData[indexPath.row].count < 6 ? width + 18 : width
        
        return CGSize(width: adjustWidth, height: 28)
    }
}

