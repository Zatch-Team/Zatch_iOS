//
//  SettingTitleTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/19.
//

import UIKit

class SettingTitleTableViewCell: BaseTableViewCell {
    
    private let titleLabel = UILabel().then{
        $0.text = "알림 설정"
        $0.font = UIFont.pretendard(size: 13, family: .Bold)
        $0.textColor = .black85
    }

    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(titleLabel)
    }
    
    override func layout() {
        super.layout()
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(17)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
    }
    
    func setTitle(_ title: String){
        titleLabel.text = title
    }
}
