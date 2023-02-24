//
//  SettingView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/19.
//

import UIKit

class SettingView: BaseView {

    let tableView = UITableView().then{
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = false
        
        $0.register(cellType: AlarmSettingTableViewCell.self)
        $0.register(cellType: DefaultSettingTableViewCell.self)
        $0.register(cellType: SettingTitleTableViewCell.self)
        $0.register(cellType: SettingBorderLineTableViewCell.self)
    }
    
    override func hierarchy() {
        self.addSubview(tableView)
    }
    
    override func layout() {
        tableView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}
