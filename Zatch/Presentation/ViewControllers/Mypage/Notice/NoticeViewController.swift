//
//  NoticeViewController.swift
//  Zatch
//
//  Created by gomin on 2022/10/26.
//

import UIKit

class NoticeViewController: BaseViewController<CenterNavigationHeaderView, NoticeView> {
    
    init(){
        super.init(headerView: CenterNavigationHeaderView(title: "공지사항"), mainView: NoticeView())
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

extension NoticeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(for: indexPath, cellType: NoticeTableViewCell.self).then{
            $0.bindingData()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(NoticeDetailViewController(), animated: true)
    }
}

