//
//  MypageView.swift
//  Zatch
//
//  Created by gomin on 2022/09/12.
//

import Foundation
import UIKit

class MypageView: UIView {
    //
   
    
    // MARK: - Functions
    var mypageTableView : UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)

//        setUpTableView()
//        setUpView()
//        setUpConstraint()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Functions
    func setUpTableView(dataSourceDelegate: UITableViewDelegate & UITableViewDataSource) {
        mypageTableView = UITableView()
        mypageTableView.then{
            $0.delegate = dataSourceDelegate
            $0.dataSource = dataSourceDelegate
            $0.register(MyInfoTableViewCell.self, forCellReuseIdentifier: "MyInfoTableViewCell")
            $0.register(CertificationBannerTableViewCell.self, forCellReuseIdentifier: "CertificationBannerTableViewCell")
            $0.register(MyZatchStatisticTableViewCell.self, forCellReuseIdentifier: "MyZatchStatisticTableViewCell")
            $0.register(TownSettingTableViewCell.self, forCellReuseIdentifier: "TownSettingTableViewCell")
            $0.register(MypageSettingTableViewCell.self, forCellReuseIdentifier: "MypageSettingTableViewCell")
            
            // autoHeight
            $0.rowHeight = UITableView.automaticDimension
            $0.estimatedRowHeight = UITableView.automaticDimension
            $0.showsVerticalScrollIndicator = false
            $0.separatorStyle = .none
        }
    }
    func setUpView() {
        addSubview(mypageTableView)
    }
    func setUpConstraint() {
        mypageTableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}

