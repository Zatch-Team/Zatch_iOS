//
//  MyZatchSheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/04.
//

import UIKit
import SnapKit

class MyZatchSheetViewController: SearchTagSheetViewController{
    
    init(){
        super.init(type: .searchMyTag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize() {
        super.initialize()
        collectionView.register(cellType: SearchMyZatchByRegisterCollectionViewCell.self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: SearchMyZatchByRegisterCollectionViewCell.self).then{
            $0.setTitle(title: tagData[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
