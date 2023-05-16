//
//  SimilarZatchTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/27.
//

import UIKit

final class SimilarZatchTableViewCell: BaseTableViewCell {
    
    var collectionView: UICollectionView!
    
    let titleLabel = UILabel().then{
        $0.text = "내 재치와 비슷한 재치"
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.textColor = .black
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
            
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .horizontal
            flowLayout.itemSize = CGSize(width: 124, height: 166)
            flowLayout.minimumInteritemSpacing = 12

            $0.collectionViewLayout = flowLayout
            $0.register(SimilarZatchCollectionViewCell.self, forCellWithReuseIdentifier: "similarCollectionCell")
            $0.showsHorizontalScrollIndicator = false
            $0.isScrollEnabled = true
            
            $0.delegate = self
            $0.dataSource = self
        }
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        baseView.addSubview(titleLabel)
        baseView.addSubview(collectionView)
    }
    
    func setUpConstraint(){
        
        baseView.snp.makeConstraints{ make in
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
        if let cell: SimilarZatchCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "similarCollectionCell", for: indexPath) as? SimilarZatchCollectionViewCell{
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
