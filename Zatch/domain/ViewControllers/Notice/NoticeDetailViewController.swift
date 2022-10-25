//
//  NoticeDetailViewController.swift
//  Zatch
//
//  Created by gomin on 2022/10/26.
//

import UIKit

class NoticeDetailViewController: BaseCenterTitleViewController {
    var noticeDetailTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        super.navigationTitle.text = "공지사항"

        setUpTableView(dataSourceDelegate: self)
        
        self.view.addSubview(noticeDetailTableView)
        noticeDetailTableView.snp.makeConstraints { make in
            make.top.equalTo(super.navigationView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
    // MARK: - Functions
    func setUpTableView(dataSourceDelegate: UITableViewDelegate & UITableViewDataSource) {
        noticeDetailTableView = UITableView()
        noticeDetailTableView.then{
            $0.delegate = dataSourceDelegate
            $0.dataSource = dataSourceDelegate
            $0.register(NoticeDetailTableViewCell.self, forCellReuseIdentifier: "NoticeDetailTableViewCell")
            
            // autoHeight
            $0.rowHeight = UITableView.automaticDimension
            $0.estimatedRowHeight = UITableView.automaticDimension
            $0.showsVerticalScrollIndicator = false
            $0.separatorStyle = .none
        }
    }
}
// MARK: - TableView delegate
extension NoticeDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeDetailTableViewCell", for: indexPath) as? NoticeDetailTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
