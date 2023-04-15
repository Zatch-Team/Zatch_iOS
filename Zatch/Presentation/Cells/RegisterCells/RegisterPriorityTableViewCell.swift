//
//  RegisterPriorityTableViewCell.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/13.
//

import Foundation

class RegisterPriorityTableViewCell: BaseTableViewCell{
    
    var priority: Int!{
        didSet{
            titleLabel.text = "\(String(priority))순위"
        }
    }
    
    private let titleLabel = UILabel().then{
        $0.setTypoStyleWithSingleLine(typoStyle: .medium14)
    }
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(titleLabel)
    }
    
    override func layout() {
        super.layout()
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().offset(36)
        }
    }
}
