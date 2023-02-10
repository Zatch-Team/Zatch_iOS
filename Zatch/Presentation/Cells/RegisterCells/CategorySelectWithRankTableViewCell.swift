//
//  CategorySelectWithRankTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/10.
//

import UIKit

class CategorySelectWithRankTableViewCell: RegisterCategorySelectTableViewCell {
    
    let rankLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(rankLabel)
    }
    
    override func layout() {
        
        super.layout()
        
        baseView.snp.makeConstraints{ make in
            make.height.equalTo(88)
        }
        
        rankLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(36)
        }
        
        super.categoryFrame.snp.removeConstraints()
        
        categoryFrame.snp.makeConstraints{ make in
            make.top.equalTo(rankLabel.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(41)
        }
    }
    
}
