//
//  OthersZatchDetailViewController.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/14.
//

import Foundation

final class OthersZatchDetailViewController: ZatchDetailViewController{
    
    init(zatch: ZatchResponseModel){
        super.init(zatch: zatch, writer: .others) //임시
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func etcBtnDidTapped() {
        //기능 없음
    }
    
    override func likeBtnDidTapped() {
        //TODO: 좋아요 / 좋아요 취소
    }
    
    override func chatBtnDidTapped() {
        //TODO: 채팅방 이동
    }
}
