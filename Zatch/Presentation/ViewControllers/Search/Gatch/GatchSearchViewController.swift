//
//  GatchSearchViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/12.
//

import UIKit

class GatchSearchViewController: BaseLeftTitleViewController {
    
    init(){
        super.init(headerView: LeftNavigationTitleHeaderView(title: "가치"), mainView: GatchSearchMainView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
