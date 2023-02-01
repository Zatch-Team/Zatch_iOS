//
//  ReviewViewController.swift
//  Zatch
//
//  Created by gomin on 2022/10/05.
//

import UIKit

class ReviewViewController: BaseCenterTitleViewController {
    var reviewTableView: UITableView!
    var profileUserName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        super.navigationTitle.text = "한 줄 후기"
        
        setUpTableView(dataSourceDelegate: self)
        self.view.addSubview(reviewTableView)
        reviewTableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(super.headerView.snp.bottom)
            make.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Functions
    func setUpTableView(dataSourceDelegate: UITableViewDelegate & UITableViewDataSource) {
        reviewTableView = UITableView()
        reviewTableView.then{
            $0.delegate = dataSourceDelegate
            $0.dataSource = dataSourceDelegate
            $0.register(ReviewProfileTableViewCell.self, forCellReuseIdentifier: "ReviewProfileTableViewCell")
            $0.register(DateTableViewCell.self, forCellReuseIdentifier: "DateTableViewCell")
            $0.register(OtherReviewTableViewCell.self, forCellReuseIdentifier: "OtherReviewTableViewCell")
            
            // autoHeight
            $0.rowHeight = UITableView.automaticDimension
            $0.estimatedRowHeight = UITableView.automaticDimension
            $0.showsVerticalScrollIndicator = false
            $0.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            $0.separatorStyle = .none
        }
    }
}
// MARK: - TableView delegate
extension ReviewViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {return 1}
        else {return 2}
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 프로필 Cell
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewProfileTableViewCell", for: indexPath)
                    as? ReviewProfileTableViewCell else { return UITableViewCell() }
            cell.setUpName(name: "긍정적인 수달")
            cell.selectionStyle = .none
            return cell
        } else {
            // 날짜 Cell
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "DateTableViewCell", for: indexPath)
                        as? DateTableViewCell else { return UITableViewCell() }
                cell.selectionStyle = .none
                return cell
                
            } else {
                // 한 줄 후기 Cell
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "OtherReviewTableViewCell", for: indexPath)
                        as? OtherReviewTableViewCell else { return UITableViewCell() }
                cell.selectionStyle = .none
                return cell
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
