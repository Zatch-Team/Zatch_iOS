//
//  SimilarZatchTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/27.
//

import UIKit

class SimilarZatchTableViewCell: UITableViewCell {
    
    let collectionView : UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 124, height: 166)
        flowLayout.minimumInteritemSpacing = 12

        let collectionView = UICollectionView(frame: .init(), collectionViewLayout: flowLayout)
        collectionView.register(SimilarZatchCollectionViewCell.self, forCellWithReuseIdentifier: "similarCollectionCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = true

        return collectionView
    }()
    
    let titleLabel = UILabel().then{
        $0.text = "내 재치와 비슷한 재치"
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.textColor = .black
    }
    
    let backView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstraint()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        self.contentView.addSubview(backView)
        
        self.backView.addSubview(titleLabel)
        self.backView.addSubview(collectionView)
        
    }
    
    func setUpConstraint(){
        
        self.backView.snp.makeConstraints{ make in
            make.height.equalTo(246)
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(24)
        }
        
        collectionView.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(28)
            make.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}

extension SimilarZatchTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: SimilarZatchCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "similarCollectionCell", for: indexPath) as? SimilarZatchCollectionViewCell{
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
