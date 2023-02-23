//
//  ProfileView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/23.
//

import Foundation

class ProfileView: BaseView{
    
    let tableView = UITableView().then{
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        
        $0.register(cellType: ProfileTableViewCell.self)
        $0.register(cellType: TitleAndMoreButtonTableViewCell.self)
        $0.register(cellType: ZatchTableViewCell.self)
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
