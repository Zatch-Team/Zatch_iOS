//
//  OthersZatchDetailStrategy.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/14.
//

import Foundation

class OthersZatchDetailStrategy: DetailStrategy{
    
    private let vc: UIViewController
    
    required init(vc: UIViewController) {
        self.vc = vc
    }
    
    func etcBtnDidTapped() {
        //기능 없음
    }
    
    func likeBtnDidTapped() {
        //TODO: 좋아요 / 좋아요 취소
    }
    
    func chatBtnDidTapped() {
        //TODO: 채팅방 이동
    }
    
    
}
