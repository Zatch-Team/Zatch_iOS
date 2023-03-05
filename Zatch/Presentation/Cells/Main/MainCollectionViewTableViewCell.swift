//
//  MainCollectionViewTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/06.
//

import UIKit

class MainCollectionViewTableViewCell: BaseTableViewCell {
    
    let label = UILabel().then{
        $0.text = "내 주변 재치"
        $0.setTypoStyleWithSingleLine(typoStyle: .bold18)
        $0.textColor = .black85
    }
    let subLabel = UILabel().then{
        $0.text = "내 주변에서는 이런 재치들이 거래되고 있어요!"
        $0.setTypoStyleWithSingleLine(typoStyle: .medium15_19)
        $0.textColor = .black30
    }
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()) .then{
        
        let flowLayout = UICollectionViewFlowLayout().then{
            $0.minimumInteritemSpacing = 0
            $0.minimumLineSpacing = 16
            $0.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            $0.itemSize = MainZatchCollectionViewCell.cellSize
            $0.scrollDirection = .horizontal
        }
        
        $0.collectionViewLayout = flowLayout
        $0.showsHorizontalScrollIndicator = false
        
        $0.register(MainZatchCollectionViewCell.self, forCellWithReuseIdentifier: MainZatchCollectionViewCell.cellIdentifier)
    }

    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(label)
        baseView.addSubview(subLabel)
        baseView.addSubview(collectionView)
    }
    
    override func layout() {
        
        super.layout()
        
        baseView.snp.makeConstraints{
            $0.height.equalTo(362)
        }
        
        label.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(20)
        }
        subLabel.snp.makeConstraints {
            $0.leading.equalTo(label.snp.leading)
            $0.top.equalTo(label.snp.bottom).offset(4)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(subLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(28)
        }
    }
}
