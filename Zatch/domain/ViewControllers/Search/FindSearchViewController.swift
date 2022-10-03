//
//  SecondSearchViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/01.
//

import UIKit
import SnapKit

class FindSearchViewController: BaseViewController {
    
    //MARK: - Properties
    
    let popularData : [String] = ["몰랑이","몰랑몰랑","몰랑","말랑이","말랭"]
    let findData : [String] = ["몰랑이","몰랑몰랑","몰랑","말랑이","말랭"]
    
    var currentSelect: SearchTagCollectionViewCell?
    
    let mainView = FindSearchView().then{
        $0.nextButton.addTarget(self, action: #selector(moveToResultVC(_:)), for: .touchUpInside)
    }
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        mainView.firstCollectionView.delegate = self
        mainView.firstCollectionView.dataSource = self
        
        mainView.secondCollectionView.delegate = self
        mainView.secondCollectionView.dataSource = self
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(88)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    
    //MARK: Action
    
    @objc func moveToResultVC(_ sender: UIButton){
        let nextVC = ResultSearchViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}

extension FindSearchViewController: CellCalledViewController{
    
    func newCellIsSelected(_ cell: UICollectionViewCell){
        if(currentSelect == cell){
            currentSelect?.setBtnInitState()
            currentSelect = nil
            mainView.wantTextField.text = ""
        }else{
            if let newCell = cell as? FindSearchTagCollectionViewCell {
                
                newCell.setBtnSelectedState()
                
                mainView.wantTextField.text = newCell.selectBtn.title(for: .normal)
                
                currentSelect?.setBtnInitState()
                currentSelect = newCell
            }
        }
    }
    
    func newCellIsSelected(_ indexPath: IndexPath) { }
}

extension FindSearchViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == mainView.firstCollectionView ? popularData.count : findData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FindSearchTagCollectionViewCell.cellIdentifier,
                                                            for: indexPath) as? FindSearchTagCollectionViewCell else { fatalError()}
        
        let title = collectionView == mainView.firstCollectionView ? popularData[indexPath.row] : findData[indexPath.row]
        
        cell.delegate = self
        cell.selectBtn.setTitle(title, for: .normal)
        cell.setBtnInitState()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let title = collectionView == mainView.firstCollectionView ? popularData[indexPath.row] : findData[indexPath.row]
        
        let tmpLabel = UILabel().then{
            $0.text = title
            $0.numberOfLines = 1
            $0.sizeToFit()
        }

        let width = tmpLabel.frame.size.width
        
        let adjustWidth = title.count < 6 ? width + 18 : width
        
        return CGSize(width: adjustWidth, height: 28)
    }
    
}
