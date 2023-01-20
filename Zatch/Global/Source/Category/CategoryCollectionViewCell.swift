//
//  CategoryButtonView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/09.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    static let cellIdentifier = "categoryCell"
    
    let backView = UIView()
    
    let categoryImage = UIImageView()
    
    let categoryText = UILabel().then{
        $0.font = UIFont.pretendard(family: .Bold)
        $0.textAlignment = .center
    }

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.contentView.addSubview(backView)
        
        self.backView.addSubview(categoryImage)
        self.backView.addSubview(categoryText)
        
        setUpConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func setUpConstraint(){
        
        self.backView.snp.makeConstraints{ make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        self.categoryImage.snp.makeConstraints{ make in
            make.height.equalTo(categoryImage.snp.width)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-31)
            make.top.equalToSuperview().offset(5)
        }
        
        self.categoryText.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(categoryImage.snp.bottom).offset(8)
            make.bottom.equalToSuperview().offset(-6)
            make.height.equalTo(17)
            
        }
    }
    
}
