//
//  NoticeDetailViewController.swift
//  Zatch
//
//  Created by gomin on 2022/10/26.
//

import UIKit


class NoticeDetailViewController: BaseViewController<CenterNavigationHeaderView, NoticeDetailView> {
    
    init(){
        super.init(headerView: CenterNavigationHeaderView(title: "공지사항"),
                   mainView: NoticeDetailView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
