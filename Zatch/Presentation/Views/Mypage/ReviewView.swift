//
//  ReviewView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/24.
//

import Foundation

class ReviewView: BaseView{
    
    let reviewTableView = UITableView().then{
        // autoHeight
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = UITableView.automaticDimension
        $0.showsVerticalScrollIndicator = false
        $0.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        $0.register(cellType: ReviewProfileTableViewCell.self)
        $0.register(cellType: DateTableViewCell.self)
        $0.register(cellType: OtherReviewTableViewCell.self)
    }
    
    override func hierarchy() {
        self.addSubview(reviewTableView)
    }
    
    override func layout() {
        reviewTableView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }

}
