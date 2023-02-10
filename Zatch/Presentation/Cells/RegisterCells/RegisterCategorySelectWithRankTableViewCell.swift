//
//  CategorySelectWithRankTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/10.
//

import UIKit

class RegisterCategorySelectWithRankTableViewCell: BaseTableViewCell {
    
    let rankLabel = UILabel().then{
        $0.setTypoStyleWithSingleLine(typoStyle: .medium14)
    }
    private let mainView = RegisterCategorySelectView()
    
    //MARK: - Helper
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(rankLabel)
        baseView.addSubview(mainView)
    }
    
    override func layout() {
        
        super.layout()
        
        baseView.snp.makeConstraints{
            $0.height.equalTo(88)
        }
        rankLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(36)
        }
        mainView.snp.makeConstraints{
            $0.top.equalTo(rankLabel.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}
