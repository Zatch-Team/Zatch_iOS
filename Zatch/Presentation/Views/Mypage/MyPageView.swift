//
//  MypageView.swift
//  Zatch
//
//  Created by gomin on 2022/09/12.
//

import Foundation
import UIKit

class MyPageView: BaseView {
    
    let tableView = UITableView().then{
        // autoHeight
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = UITableView.automaticDimension
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        
        $0.register(cellType: MyInfoTableViewCell.self)
        $0.register(cellType: BannerTableViewCell.self)
        $0.register(cellType: MyZatchStatisticTableViewCell.self)
        $0.register(cellType: TownSettingTableViewCell.self)
        $0.register(cellType: BaseMyPageTableViewCell.self)
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

