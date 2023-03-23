//
//  WantZatchSheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/07.
//

import UIKit

class SearchWantRegisterZatchSheetViewController: SearchTagSheetViewController{
    
    init(viewModel: ZatchSearchResultViewModel){
        super.init(viewModel: viewModel, type: .searchWantTag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize() {
        super.initialize()
        collectionView.register(cellType: SearchWantZatchByRegisterCollectionViewCell.self)
    }
    
    //MARK: - CollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getLookingForZatchCount()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //객체 생성될 때 한번만 로드
        return collectionView.dequeueReusableCell(for: indexPath, cellType: SearchWantZatchByRegisterCollectionViewCell.self).then{
            $0.setTitle(title: viewModel.getLookingForProduct(at: indexPath.row))
            $0.isSelectedState = viewModel.isLookingForZatchSelected(at: indexPath.row) ? true : false
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        SearchWantZatchByRegisterCollectionViewCell.getEstimatedSize(title: viewModel.getLookingForProduct(at: indexPath.row))
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.changeWantProductByLookingForZatch(at: indexPath.row)
        super.collectionView(collectionView, didSelectItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.dequeueReusableCell(for: indexPath, cellType: SearchWantZatchByRegisterCollectionViewCell.self).isSelectedState = false
    }

}
