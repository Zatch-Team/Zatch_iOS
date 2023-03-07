//
//  SettingBorderLineTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/19.
//

import UIKit

class SettingBorderLineTableViewCell: BaseTableViewCell {

    private let borderLine = ZatchComponent.BorderLine(color: .black5, height: 1.2)
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(borderLine)
    }
    
    override func layout() {
        super.layout()
        borderLine.snp.makeConstraints{
            $0.top.equalToSuperview().offset(12)
            $0.centerY.leading.trailing.equalToSuperview()
        }
    }
}
