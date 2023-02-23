//
//  MyProfileViewController.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/23.
//

import Foundation

class MyProfileViewController: ProfileViewController{
    
    override var userAttachTitle: String?{
        return "나의 재치 현황"
    }
    
    init(){
        super.init(headerView: EtcButtonHeaderView(title: "수정"))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func etcButtonDidTapped() {
        print("수정임")
    }
    
}
