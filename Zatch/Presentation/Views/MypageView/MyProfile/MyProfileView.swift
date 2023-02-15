//
//  MyProfileView.swift
//  Zatch
//
//  Created by gomin on 2022/09/13.
//

import Foundation
import UIKit

class MyProfileView: UIView {
    // MARK: - Life Cycles
    var profileTableView : UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Functions
    func setUpTableView(dataSourceDelegate: UITableViewDelegate & UITableViewDataSource) {
        profileTableView = UITableView()
        profileTableView.then{
            $0.delegate = dataSourceDelegate
            $0.dataSource = dataSourceDelegate
            $0.register(ProfileTableViewCell.self, forCellReuseIdentifier: "ProfileTableViewCell")
            $0.register(ZatchTableViewCell.self, forCellReuseIdentifier: "MyZatchTableViewCell")
            
            // autoHeight
            $0.rowHeight = UITableView.automaticDimension
            $0.estimatedRowHeight = UITableView.automaticDimension
            $0.showsVerticalScrollIndicator = false
            $0.separatorStyle = .none
        }
    }
    func setUpView() {
        addSubview(profileTableView)
    }
    func setUpConstraint() {
        profileTableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
