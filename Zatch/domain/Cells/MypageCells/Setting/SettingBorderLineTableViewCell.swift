//
//  SettingBorderLineTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/19.
//

import UIKit

class SettingBorderLineTableViewCell: BaseTableViewCell {

    static let cellIdentifier = "AlarmSettingTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
