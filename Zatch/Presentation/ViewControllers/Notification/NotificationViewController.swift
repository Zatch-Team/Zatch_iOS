//
//  NotificationViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/27.
//

import UIKit

class NotificationViewController: BaseCenterTitleViewController {
    var notificationView: NotificationView!

    override func viewDidLoad() {
        super.viewDidLoad()

//        super.navigationTitle.text = "알림"
        
        notificationView = NotificationView()
        self.view.addSubview(notificationView)
        notificationView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
            make.top.equalTo(super.headerView.snp.bottom)
        }
        notificationView.setUpTableView(dataSourceDelegate: self)
        notificationView.setUpView()
    }
}
// MARK: - TableView delegate
extension NotificationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NotiTableViewCell", for: indexPath) as? NotiTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.setCellData("재치")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 91
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
