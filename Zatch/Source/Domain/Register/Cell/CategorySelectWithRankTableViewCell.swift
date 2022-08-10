//
//  CategorySelectWithRankTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/10.
//

import UIKit

class CategorySelectWithRankTableViewCell: CategorySelectTableViewCell {
    
    let rankLabel = UILabel().then{
//        $0.text = "1순위"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
    }

    //MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUpView()
        setUpConstriant()
//        setUpValue()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper
    override func setUpView() {
        
        super.setUpView()
        
        self.backView.addSubview(rankLabel)
    }
    
    override func setUpConstriant() {
        
        super.setUpConstriant()
        
        self.contentView.snp.removeConstraints()
        
        super.contentView.snp.updateConstraints{ make in
            make.leading.trailing.top.bottom.equalToSuperview()
            make.height.equalTo(88)
        }
        
        super.categoryFrame.snp.removeConstraints()
        
        rankLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(36)
            make.height.equalTo(17)
        }
        
        super.categoryFrame.snp.makeConstraints{ make in
            make.top.equalTo(rankLabel.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(41)
        }
        
    }
    
}
