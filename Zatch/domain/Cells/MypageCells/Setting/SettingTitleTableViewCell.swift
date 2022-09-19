//
//  SettingTitleTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/19.
//

import UIKit

class SettingTitleTableViewCell: BaseTableViewCell {
    
    let titleLabel = UILabel().then{
        $0.text = "알림 설정"
        $0.font = UIFont.pretendard(size: 13, family: .Bold)
        $0.textColor = .black85
    }
    
    static let cellIdentifier = "SettingTitleTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.baseView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(17)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
