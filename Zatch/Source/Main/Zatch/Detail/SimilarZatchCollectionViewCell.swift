//
//  SimilarZatchCollectionViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/27.
//

import UIKit

class SimilarZatchCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView().then{
        $0.backgroundColor = .black10
        $0.layer.cornerRadius = 8
    }
    
    let productLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 13, family: .Bold)
        $0.text = "내가 받을 상품명"
        $0.textColor = .black85
    }
    
    let categoryLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 10, family: .Medium)
        $0.text = "카테고리"
        $0.textColor = .black20
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)

        setUpView()
        setUpConstraint()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(productLabel)
        self.contentView.addSubview(categoryLabel)
    }
    
    func setUpConstraint(){
        
//        self.contentView.snp.makeConstraints{ make in
//            make.width.equalTo(124)
//            make.height.equalTo(166)
//        }
        
        imageView.snp.makeConstraints{ make in
            make.width.equalTo(124)
            make.height.equalTo(112)
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        productLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(12)
        }
        
        categoryLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.top.equalTo(productLabel.snp.bottom).offset(4)
        }
    }
}
