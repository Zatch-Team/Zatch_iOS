//
//  GatchDetailView.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/02.
//

import UIKit

class GatchDetailView: BaseView {
    
    let infoTableView = UITableView().then{
        $0.register(GatchDetailInfomationTableViewCell.self,
                    forCellReuseIdentifier: GatchDetailInfomationTableViewCell.cellIdentifier)
        $0.register(DetailImageTableViewCell.self, forCellReuseIdentifier: DetailImageTableViewCell.cellIdentifier)
    }
    
    override func hierarchy() {
        self.addSubview(infoTableView)
    }
    
    override func layout() {
        infoTableView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
