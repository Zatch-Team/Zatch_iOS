//
//  HeartListView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/25.
//

import Foundation

class HeartListView: BaseView{
    let tableView = UITableView().then{
        $0.showsVerticalScrollIndicator = false
        $0.register(cellType: ZatchTableViewCell.self)
        $0.register(cellType: ZatchShareTableViewCell.self)
        $0.register(cellType: ZatchExchangeTableViewCell.self)
    }
    
    override func hierarchy() {
        self.addSubview(tableView)
    }
    
    override func layout() {
        tableView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}
