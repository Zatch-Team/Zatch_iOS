//
//  BaseCenterTitleViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/16.
//

import UIKit

class BaseCenterTitleViewController: BaseViewController<CenterNavigationHeaderView, BaseView> {
    
    override init(headerView: CenterNavigationHeaderView, mainView: BaseView) {
        super.init(headerView: headerView, mainView: mainView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
