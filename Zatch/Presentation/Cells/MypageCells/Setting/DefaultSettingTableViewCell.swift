//
//  DefaultSettingTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/19.
//

import UIKit

class DefaultSettingTableViewCell: BaseTableViewCell {
    
    static let cellIdentifier = "DefaultSettingTableViewCell"
    
    let titleLabel = UILabel().then{
        $0.text = "차단된 사용자"
        $0.font = UIFont.pretendard(size: 15, family: .Medium)
        $0.textColor = .black85
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.baseView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(12)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
