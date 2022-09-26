//
//  NotificationView.swift
//  Zatch
//
//  Created by gomin on 2022/09/27.
//

import Foundation
import UIKit

class NotificationView: UIView {
    // MARK: - Life Cycles
    var notiTableView : UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Functions
    func setUpTableView(dataSourceDelegate: UITableViewDelegate & UITableViewDataSource) {
        notiTableView = UITableView()
        notiTableView.then{
            $0.delegate = dataSourceDelegate
            $0.dataSource = dataSourceDelegate
            $0.register(NotiTableViewCell.self, forCellReuseIdentifier: "NotiTableViewCell")
            
            // autoHeight
            $0.rowHeight = UITableView.automaticDimension
            $0.estimatedRowHeight = UITableView.automaticDimension
            $0.showsVerticalScrollIndicator = false
            $0.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        setEmptyView()
    }
    func setUpView() {
        addSubview(notiTableView)
        notiTableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    // Empty View
    func setEmptyView() {
        let messageLabel = UILabel().then{
           $0.font = UIFont.pretendard(size: 13, family: .Medium)
           $0.textColor = .black85
           $0.textAlignment = .center
           $0.text = "새로운 알림이 없습니다."
           $0.numberOfLines = 0
           $0.sizeToFit()
        }
        let backgroudView = UIView(frame: CGRect(x: 0, y: 0, width: notiTableView.bounds.width, height: notiTableView.bounds.height))
        backgroudView.addSubview(messageLabel)

        messageLabel.snp.makeConstraints { make in
           make.top.equalToSuperview().offset(32)
           make.centerX.equalToSuperview()
        }

        notiTableView.backgroundView = backgroudView
   }
}
