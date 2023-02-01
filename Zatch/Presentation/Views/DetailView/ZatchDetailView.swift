//
//  DetailView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/28.
//

import UIKit

class ZatchDetailView: BaseView {
    
    var tableView = UITableView().then{
        $0.contentInset = UIEdgeInsets(top: -48, left: 0, bottom: 0, right: 0)
        $0.showsVerticalScrollIndicator = false
        
        $0.register(cellType: DetailImageTableViewCell.self)
        $0.register(cellType: ExchangeDetailTableViewCell.self)
        $0.register(cellType: ShareDetailTableViewCell.self)
        $0.register(cellType: ProductInfoTableViewCell.self)
        $0.register(cellType: MoreTextTableViewCell.self)
        $0.register(cellType: SimilarZatchTableViewCell.self)
    }
    let bottomView = BottomFixView()

    override func hierarchy() {
        self.addSubview(tableView)
        self.addSubview(bottomView)
    }
    
    override func layout() {
        tableView.snp.makeConstraints{make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(bottomView.snp.top)
        }
        
        bottomView.snp.makeConstraints{ make in
            make.bottom.equalTo(self.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
    }
}
