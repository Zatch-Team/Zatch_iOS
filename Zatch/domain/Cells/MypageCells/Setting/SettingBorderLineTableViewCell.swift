//
//  SettingBorderLineTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/19.
//

import UIKit

class SettingBorderLineTableViewCell: BaseTableViewCell {

    static let cellIdentifier = "SettingBorderLineTableViewCell"
    
    let borderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.baseView.addSubview(borderLine)
        
        borderLine.snp.makeConstraints{
            $0.top.equalToSuperview().offset(12)
            $0.centerY.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
