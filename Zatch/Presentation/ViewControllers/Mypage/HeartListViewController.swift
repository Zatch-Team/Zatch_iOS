//
//  HeartListViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/19.
//
import UIKit
import SnapKit


class HeartListViewController: BaseViewController<CenterNavigationHeaderView, TableOnlyView> {
    
    init(){
        super.init(headerView: CenterNavigationHeaderView(title: "관심 목록"), mainView: TableOnlyView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize() {
        super.initialize()
        mainView.tableView.initializeDelegate(self)
        mainView.registerCell(cellTypes: [ZatchTableViewCell.self,
                                          ZatchShareTableViewCell.self,
                                          ZatchExchangeTableViewCell.self])
    }

}

extension HeartListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(for: indexPath, cellType: ZatchTableViewCell.self)
    }
}
