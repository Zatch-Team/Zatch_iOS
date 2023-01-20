//
//  UITableView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/19.
//

import Foundation

extension UITableView{
    
    func settingCustomTableView(_ viewController: UIViewController){
        self.dataSource = viewController as! UITableViewDataSource
        self.delegate = viewController as! UITableViewDelegate
        self.separatorStyle = .none
    }
    
}
