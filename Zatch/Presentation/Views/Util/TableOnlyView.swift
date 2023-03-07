//
//  TableOnlyView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/07.
//

import Foundation

class TableOnlyView: BaseView{
    
    let tableView = UITableView()
    
    override func style() {
        tableView.showsVerticalScrollIndicator = false
    }
    
    override func hierarchy() {
        addSubview(tableView)
    }
    
    override func layout() {
        tableView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func registerCell(cellTypes: [BaseTableViewCell.Type]){
        cellTypes.forEach{
            tableView.register(cellType: $0)
        }
    }
    
}
