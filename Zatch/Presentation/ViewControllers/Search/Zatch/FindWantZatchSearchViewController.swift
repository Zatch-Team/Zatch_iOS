//
//  SecondSearchViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/01.
//

import UIKit
import SnapKit

class FindWantZatchSearchViewController: BaseViewController<BaseHeaderView, FindWantZatchSearchView> {
    
    //MARK: - Properties
    
    private var popularData : [String] = ["몰랑이","몰랑몰랑","몰랑"] //최대 3개
    private var findData : [String] = ["몰랑이","몰랑몰랑","몰랑"] //최대 3개
    private var currentSelectCell: SearchTagCollectionViewCell?{
        didSet{
            currentSelectCell?.isSelectState = true
        }
    }
    
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
        
        mainView.nextButton.addTarget(self, action: #selector(moveToResultVC(_:)), for: .touchUpInside)
        
        mainView.firstCollectionView.delegate = self
        mainView.firstCollectionView.dataSource = self
        
        mainView.secondCollectionView.delegate = self
        mainView.secondCollectionView.dataSource = self
    }
    
    @objc private func moveToResultVC(_ sender: UIButton){
        let nextVC = ResultSearchViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    private func setFlexibleSearchAttribute(){
        mainView.myProductNameLabel.text = "???"
        mainView.myProductNameLabel.textColor = .zatchYellow
        mainView.nextButton.setTitle("유연한 탐색", for: .normal)
    }
    
}

extension FindWantZatchSearchViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == mainView.firstCollectionView ? popularData.count : findData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let title = collectionView == mainView.firstCollectionView ? popularData[indexPath.row] : findData[indexPath.row]
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: SearchTagCollectionViewCell.self).then{
            $0.setTitle(title)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let title = collectionView == mainView.firstCollectionView ? popularData[indexPath.row] : findData[indexPath.row]
        return SearchTagCollectionViewCell.getEstimatedSize(title: title)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectCell = collectionView.cellForItem(at: indexPath, cellType: SearchTagCollectionViewCell.self) else { return }
        guard let willDeselectCell = currentSelectCell else {
            currentSelectCell = selectCell
            return
        }
        
        willDeselectCell.isSelectState = false
        currentSelectCell = selectCell == willDeselectCell ? nil : selectCell
    }
}

