//
//  GatchSearchViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/12.
//

import UIKit

class GatchSearchViewController: BaseLeftTitleViewController {
    
//    let headerView = GatchSearchHeaderView()
//    let mainView = GatchSearchMainView()
    
    override func style() {
        super.style()
//        navigationTitle.text = "가치"
    }
    
    override func layout() {
        super.layout()
        
        self.view.addSubview(headerView)
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(Const.Offset.TOP_OFFSET)
        }
    }

}
