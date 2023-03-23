//
//  MyZatchSheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/04.
//

import UIKit
import SnapKit

class SearchMyRegisterZatchSheetViewController: SearchTagSheetViewController{
    
    init(viewModel: ZatchSearchResultViewModel){
        super.init(viewModel: viewModel, type: .searchMyTag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize() {
        super.initialize()
        collectionView.register(cellType: SearchMyZatchByRegisterCollectionViewCell.self)
    }
    
    //MARK: - CollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getRegisterZatchCount()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(for: indexPath, cellType: SearchMyZatchByRegisterCollectionViewCell.self).then{
            $0.setTitle(title: viewModel.getRegisterProduct(at: indexPath.row))
            $0.isSelectedState = viewModel.isRegisterZatchSelected(at: indexPath.row) ? true : false
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.changeMyProductByRegisterZatch(at: indexPath.row)
        super.collectionView(collectionView, didSelectItemAt: indexPath)
    }
    
    override func getCellTitle(index: Int) -> String {
        viewModel.getRegisterProduct(at: index)
    }
}
