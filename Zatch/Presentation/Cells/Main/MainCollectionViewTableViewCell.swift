//
//  MainCollectionViewTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/06.
//

import UIKit

class MainCollectionViewTableViewCell: BaseTableViewCell {
    
    private let title = UILabel().then{
        $0.setTypoStyleWithSingleLine(typoStyle: .bold18)
        $0.textColor = .black85
    }
    private let subtitle = UILabel().then{
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
        
        $0.register(cellType: MainZatchCollectionViewCell.self)
    }

    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(title)
        baseView.addSubview(subtitle)
        baseView.addSubview(collectionView)
    }
    
    override func layout() {
        
        super.layout()
        
        baseView.snp.makeConstraints{
            $0.height.equalTo(362)
        }
        title.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(20)
        }
        subtitle.snp.makeConstraints {
            $0.leading.equalTo(title.snp.leading)
            $0.top.equalTo(title.snp.bottom).offset(4)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(subtitle.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(28)
        }
    }
    
    func setTitleAndSubtitle(title: String, subtitle: String){
        self.title.text = title
        self.subtitle.text = subtitle
    }
}
