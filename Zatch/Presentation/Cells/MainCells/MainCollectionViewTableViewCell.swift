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
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.textColor = .black
    }
    let subLabel = UILabel().then{
        $0.text = "내 주변에서는 이런 재치들이 거래되고 있어요!"
        $0.font = UIFont.pretendard(size: 13, family: .Regular)
        $0.textColor = .systemGray
    }
    
    var collectionView : UICollectionView!

    func setUpCollectionView(_ dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate & UICollectionViewDelegateFlowLayout) {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()) .then{
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.minimumLineSpacing = 20
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            
            flowLayout.itemSize = CGSize(width: 124, height: 210)
            flowLayout.scrollDirection = .horizontal
            
            $0.collectionViewLayout = flowLayout
            $0.dataSource = dataSourceDelegate
            $0.delegate = dataSourceDelegate
            $0.showsHorizontalScrollIndicator = false
            
            $0.register(MainZatchCollectionViewCell.self, forCellWithReuseIdentifier: MainZatchCollectionViewCell.cellIdentifier)
        }
    }
    func setUpView() {
        baseView.addSubview(label)
        baseView.addSubview(subLabel)
        baseView.addSubview(collectionView)
    }
    func setUpConstraint() {
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(24)
        }
        subLabel.snp.makeConstraints { make in
            make.leading.equalTo(label.snp.leading)
            make.top.equalTo(label.snp.bottom).offset(4)
        }
        collectionView.snp.makeConstraints { make in
            make.leading.equalTo(subLabel)
            make.bottom.trailing.equalToSuperview()
            make.top.equalTo(subLabel.snp.bottom).offset(16)
        }
    }
}
