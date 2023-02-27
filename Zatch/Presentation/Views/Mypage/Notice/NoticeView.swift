//
//  NoticeView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/25.
//

import Foundation

class NoticeView: BaseView{
    
    let tableView = UITableView().then{
        $0.showsVerticalScrollIndicator = false
        
        $0.register(cellType: NoticeTableViewCell.self)
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
