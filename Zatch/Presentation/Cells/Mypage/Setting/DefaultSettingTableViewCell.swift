//
//  DefaultSettingTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/19.
//

import UIKit

class DefaultSettingTableViewCell: BaseTableViewCell {
    
    private let titleLabel = UILabel().then{
        $0.textColor = .black85
        $0.setTypoStyleWithSingleLine(typoStyle: .medium16)
    }
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(titleLabel)
    }
    
    override func layout() {
        super.layout()
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
    }
    
    func setTitle(_ title: String){
        titleLabel.text = title
    }
}
