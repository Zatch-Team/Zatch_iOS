//
//  ChattingListViewController+Layout.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/16.
//

import UIKit

extension ChattingListViewController{
    
    func setInitSetting(){
        
        super.titleLabel.text = "채팅"
        
        super.etcBtn.setImage(Image.bell, for: .normal)
        super.etcBtn.addTarget(self, action: #selector(bellBtnDidClicked), for: .touchUpInside)
        
        tableView = UITableView().then{
            
            $0.separatorStyle = .none
            $0.backgroundColor = .transparent
            
            $0.delegate = self
            $0.dataSource = self
            
            $0.register(ChattingListTableViewCell.self, forCellReuseIdentifier: ChattingListTableViewCell.cellIdentifier)
            
//            $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cellWillMoveToOriginalPosition)))
        }
    }

    func setUpView(){
        self.view.addSubview(tableView)
    }
    
    func setUpConstraint(){
        
        self.tableView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(88)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
