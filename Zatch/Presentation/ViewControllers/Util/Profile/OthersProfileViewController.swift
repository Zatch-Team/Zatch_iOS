//
//  OthersProfileViewController.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/23.
//

import Foundation

class OthersProfileViewController: ProfileViewController{
    
    var userNickname: String = "행복한 호랑이"
    override var userAttachTitle: String?{
        return "\(userNickname)님의 재치 현황"
    }
    
    init(){
        super.init(headerView: EtcButtonHeaderView(image: Image.chat))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func etcButtonDidTapped() {
        print("채팅임")
    }
}
