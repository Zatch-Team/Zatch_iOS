//
//  ZatchViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/19.
//

import UIKit

class ZatchViewController: UIViewController {
    var heartZatchTableView: UITableView!
    var heartButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
    }

}
extension ZatchViewController {
    func setUpTableView() {
        heartZatchTableView = UITableView().then{
            $0.delegate = self
            $0.dataSource = self
            $0.register(MyZatchTableViewCell.self, forCellReuseIdentifier: "MyZatchTableViewCell")
            
            // autoHeight
            $0.rowHeight = UITableView.automaticDimension
            $0.estimatedRowHeight = UITableView.automaticDimension
            $0.showsVerticalScrollIndicator = false
        }
        self.view.addSubview(heartZatchTableView)
        heartZatchTableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
// MARK: - TableView delegate
extension ZatchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyZatchTableViewCell", for: indexPath) as? MyZatchTableViewCell else { return UITableViewCell() }
        cell.addHeartToCell(color: "purple")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 138 + 12
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
