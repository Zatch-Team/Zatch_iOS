//
//  TownSearchViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/12.
//

import UIKit

class SearchTownViewController: BaseViewController<BaseHeaderView, SearchTownView> {
    
    init() {
        super.init(headerView: BaseHeaderView(), mainView: SearchTownView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize() {
        super.initialize()
        mainView.myTownCollectionView.initializeDelegate(self)
    }

}

extension SearchTownViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        return collectionView.dequeueReusableCell(for: indexPath, cellType: MyTownTagCollectionViewCell.self).then{
            $0.setTitle("성수동")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        MyTownTagCollectionViewCell.estimatedSize(of: "성수동")
    }
    
}
