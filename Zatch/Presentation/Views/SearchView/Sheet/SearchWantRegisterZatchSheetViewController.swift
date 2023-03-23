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
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: SearchWantZatchByRegisterCollectionViewCell.self).then{
            $0.setTitle(title: tagData[indexPath.row])
        }
        if(indexPath.row == currentTag){
            cell.isSelectedState = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        completion(indexPath.row)
        self.dismiss(animated: true)
    }

}
