//
//  SimilarZatchTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/27.
//

import UIKit

class SimilarZatchTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel().then{
        $0.text = "내 재치와 비슷한 재치"
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.textColor = .black
    }
    
//    let flowLayout = UICollectionViewFlowLayout().then{
//        $0.scrollDirection = .horizontal
//        $0.itemSize = CGSize(width: 124, height: 166)
//        $0.minimumInteritemSpacing = 12
//    }
    
    var collectionView : UICollectionView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 124, height: 166)
        flowLayout.minimumInteritemSpacing = 12
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(SimilarZatchCollectionViewCell.self, forCellWithReuseIdentifier: "similarCollectionCell")
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(collectionView)
    }
    
    func setUpConstraint(){
        
        self.contentView.snp.makeConstraints{ make in
            make.height.equalTo(246)
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
        print("????")
        if let cell: SimilarZatchCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "similarCollectionCell", for: indexPath) as? SimilarZatchCollectionViewCell{
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
