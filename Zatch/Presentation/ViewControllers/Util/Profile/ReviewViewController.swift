//
//  ReviewViewController.swift
//  Zatch
//
//  Created by gomin on 2022/10/05.
//

import UIKit

class ReviewViewController: BaseViewController<CenterNavigationHeaderView, TableOnlyView> {
    
    init(){
        super.init(headerView: CenterNavigationHeaderView(title: "한 줄 후기"), mainView: TableOnlyView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize() {
        super.initialize()
        mainView.tableView.initializeDelegate(self)
        mainView.registerCell(cellTypes: [ReviewProfileTableViewCell.self,
                                          DateTableViewCell.self,
                                          OtherReviewTableViewCell.self])
    }
    
    override func layout() {
        super.layout()
        mainView.setTableViewInset(leading: 20, trailing: 20)
    }
}

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

