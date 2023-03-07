//
//  SettingTitleTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/19.
//

import UIKit

class SettingTitleTableViewCell: BaseTableViewCell {
    
    private let titleLabel = UILabel().then{
        $0.setTypoStyleWithSingleLine(typoStyle: .bold14)
        $0.textColor = .black85
    }

    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(titleLabel)
    }
    
    override func layout() {
        super.layout()
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(15.5)
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
        }
    }
    
    func setTitle(_ title: String){
        titleLabel.text = title
    }
}
