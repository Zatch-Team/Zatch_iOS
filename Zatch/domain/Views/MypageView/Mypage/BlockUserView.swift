//
//  BlockUserView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/15.
//

import UIKit

class BlockUserView: UIView {
    
    var tableView: UITableView!

    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        
        tableView = UITableView().then{
            $0.separatorStyle = .none
            $0.showsVerticalScrollIndicator = false
            
            $0.register(BlockUserTableViewCell.self, forCellReuseIdentifier: BlockUserTableViewCell.cellIdentifier)
        }
        
        self.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
