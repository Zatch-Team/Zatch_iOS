//
//  BlockUserViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/15.
//

import UIKit

protocol BlockUserDelegate{
    func willBlockUser()
}

class BlockUserViewController: BaseViewController<CenterNavigationHeaderView, BlockUserView> {
    
    var blockData = [String](repeating: "test", count: 10) {
        didSet{
            mainView.tableView.reloadData()
        }
    }
    
    init(){
        super.init(headerView: CenterNavigationHeaderView(title: "차단된 사용자"), mainView: BlockUserView())
    }
    
    required init?(coder: NSCoder) {
        super.init(headerView: CenterNavigationHeaderView(title: "차단된 사용자"), mainView: BlockUserView())
//        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize(){
        super.initialize()
        mainView.tableView.separatorStyle = .none
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
}

extension BlockUserViewController: BlockUserDelegate{
    func willBlockUser(){
        Alert.UnBlock.show(in: self).do{
            $0.completion = {
                print("block success")
            }
        }
    }
}

extension BlockUserViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return blockData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        return tableView.dequeueReusableCell(for: indexPath, cellType: BlockUserTableViewCell.self).then{
            $0.delegate = self
            $0.bindingData()
        }
    }

}
