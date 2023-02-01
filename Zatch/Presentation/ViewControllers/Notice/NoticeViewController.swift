//
//  NoticeViewController.swift
//  Zatch
//
//  Created by gomin on 2022/10/26.
//

import UIKit

class NoticeViewController: BaseCenterTitleViewController {
    var noticeTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        super.navigationTitle.text = "공지사항"

        setUpTableView(dataSourceDelegate: self)
        
        self.view.addSubview(noticeTableView)
        noticeTableView.snp.makeConstraints { make in
            make.top.equalTo(super.headerView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
    // MARK: - Functions
    func setUpTableView(dataSourceDelegate: UITableViewDelegate & UITableViewDataSource) {
        noticeTableView = UITableView()
        noticeTableView.then{
            $0.delegate = dataSourceDelegate
            $0.dataSource = dataSourceDelegate
            $0.register(NoticeTableViewCell.self, forCellReuseIdentifier: "NoticeTableViewCell")
            
            // autoHeight
            $0.rowHeight = UITableView.automaticDimension
            $0.estimatedRowHeight = UITableView.automaticDimension
            $0.showsVerticalScrollIndicator = false
            $0.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}
// MARK: - TableView delegate
extension NoticeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for: indexPath) as? NoticeTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = NoticeDetailViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
