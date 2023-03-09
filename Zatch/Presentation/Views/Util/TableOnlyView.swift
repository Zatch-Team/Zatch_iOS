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
    
    func setTableViewInset(top: CGFloat = 0, bottom: CGFloat = 0, leading: CGFloat = 0, trailing: CGFloat = 0){
        tableView.snp.updateConstraints{
            $0.top.equalToSuperview().inset(top)
            $0.leading.equalToSuperview().inset(leading)
            $0.trailing.equalToSuperview().inset(trailing)
            $0.bottom.equalToSuperview().inset(bottom)
        }
    }
    
}
