//
//  ChattingListViewController+Layout.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/16.
//

import UIKit

extension ChattingListViewController{
    
    func setInitSetting(){
        super.titleLabel.text = "채팅"
        
        super.etcBtn.setImage(UIImage(named: "bell"), for: .normal)
        super.etcBtn.addTarget(self, action: #selector(bellBtnDidClicked), for: .touchUpInside)
    }

    func setUpView(){
    }
    
    func setUpConstraint(){
    }
}
