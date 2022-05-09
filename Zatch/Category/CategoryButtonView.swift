//
//  CategoryButtonView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/09.
//

import UIKit

class CategoryButtonView: UIView {
    
    let categoryImage = UIImageView()
    let categoryText = UILabel()

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        categoryText.font = UIFont.pretendard(family: .Bold)
        categoryText.textAlignment = .center
        
        categoryImage.backgroundColor = .black45
        
        self.addSubview(categoryImage)
        self.addSubview(categoryText)
        
        setUpConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func setUpConstraint(){
        
        self.categoryImage.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-25)
            make.top.equalToSuperview().offset(6)
        }
        
        self.categoryText.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.top.equalTo(categoryImage.snp.bottom).offset(8)
        }
    }
    
}
