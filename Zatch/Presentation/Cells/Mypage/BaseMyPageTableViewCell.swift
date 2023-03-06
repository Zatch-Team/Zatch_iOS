//
//  BaseMyPageTableViewCell.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/23.
//

import Foundation

class BaseMyPageTableViewCell: BaseTableViewCell{
    
    let titleLabel = UILabel().then{
        $0.setTypoStyleWithSingleLine(typoStyle: .medium16)
        $0.textColor = .black85
    }
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(titleLabel)
    }
    
    override func layout() {
        super.layout()
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
        }
    }
    
    func setTitle(_ title: String){
        titleLabel.text = title
    }
}
