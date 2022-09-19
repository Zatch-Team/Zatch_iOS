//
//  SettingView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/19.
//

import UIKit

class SettingView: UIView {

    let tableView = UITableView().then{
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = false
        
        $0.register(AlarmSettingTableViewCell.self, forCellReuseIdentifier: AlarmSettingTableViewCell.cellIdentifier)
        $0.register(DefaultSettingTableViewCell.self, forCellReuseIdentifier: DefaultSettingTableViewCell.cellIdentifier)
        $0.register(SettingTitleTableViewCell.self, forCellReuseIdentifier: SettingTitleTableViewCell.cellIdentifier)
        $0.register(SettingBorderLineTableViewCell.self, forCellReuseIdentifier: SettingBorderLineTableViewCell.cellIdentifier)
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        
        self.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
