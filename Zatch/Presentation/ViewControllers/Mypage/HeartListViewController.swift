//
//  HeartListViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/19.
//
import UIKit
import SnapKit


class HeartListViewController: BaseViewController<CenterNavigationHeaderView, HeartListView> {
    
    init(){
        super.init(headerView: CenterNavigationHeaderView(title: "관심 목록"), mainView: HeartListView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize() {
        super.initialize()
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.separatorStyle = .none
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
