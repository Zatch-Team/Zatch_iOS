//
//  MyZatchChildViewController.swift
//  Zatch
//
//  Created by gomin on 2022/10/26.
//

import UIKit

class MyZatchChildViewController: UIViewController {
    var heartZatchTableView: UITableView!
    var heartButton: UIButton!
    var filterBar: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpFilterBar()
        setUpTableView()
    }
    
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
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(filterBar.snp.bottom)
        }
    }
    func setUpFilterBar() {
        filterBar = UIView().then{
            $0.backgroundColor = .white
        }
        let filterButton = UIButton().then{
            $0.setTitle("전체보기", for: .normal)
            $0.semanticContentAttribute = .forceRightToLeft
            $0.titleLabel?.font = UIFont.pretendard(size: 14, family: .Medium)
            $0.setTitleColor(.black85, for: .normal)
            $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 4)
            
            $0.setImage(UIImage(named: "arrow_down"), for: .normal)
            $0.setImage(UIImage(named: "arrow_up"), for: .selected)
        }
        self.view.addSubview(filterBar)
        filterBar.addSubview(filterButton)
        
        filterBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(36)
        }
        filterButton.snp.makeConstraints { make in
            make.width.equalTo(85)
            make.height.equalTo(20)
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
    }
}
// MARK: - TableView delegate
extension MyZatchChildViewController: UITableViewDelegate, UITableViewDataSource {
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
