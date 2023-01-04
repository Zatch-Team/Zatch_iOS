//
//  GatchDetailView.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/02.
//

import UIKit

class GatchDetailView: BaseView {
    
    let infoTableView = UITableView().then{
        $0.contentInsetAdjustmentBehavior = .never
        $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 110, right: 0)
        $0.showsVerticalScrollIndicator = false
        
        $0.register(GatchDetailInfomationTableViewCell.self,
                    forCellReuseIdentifier: GatchDetailInfomationTableViewCell.cellIdentifier)
        $0.register(DetailImageTableViewCell.self, forCellReuseIdentifier: DetailImageTableViewCell.cellIdentifier)
    }
    
    let bottomFixView = GatchDetailBottomFixView()
    
    override func hierarchy() {
        self.addSubview(infoTableView)
        self.addSubview(bottomFixView)
    }
    
    override func layout() {
        infoTableView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        bottomFixView.snp.makeConstraints{
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}

