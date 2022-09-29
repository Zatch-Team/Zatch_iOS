//
//  SearchViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/04/30.
//

import UIKit
import SnapKit

class MySearchViewController: BaseViewController{
    
    //MARK: - Properties
    
    let myZatchData: [String] = ["몰랑이 피규어","매일우유 250ml","콜드브루 60ml","예시가 있다면","이렇게 들어가야","해요요요요","해요요요","해요요","해요","해","아아앙아ㅏ앙아아앙아아"]
    
    var currentSelect: Int = -1
    
    let mainView = MySearchView().then{
        $0.nextButton.addTarget(self, action: #selector(nextButtonClick), for: .touchUpInside)
    }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    
    //MARK: Action
    
    @objc
    func nextButtonClick(_ sender: UIButton){
        
        let nextVC = FindSearchViewController()
        
        nextVC.myLabel.text = mainView.selectTextField.text
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension MySearchViewController: CellCalledViewController{
    
    func newCellIsSelected(_ indexPath: IndexPath){
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
    
    func newCellIsSelected(_ cell: UICollectionViewCell) { }
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
