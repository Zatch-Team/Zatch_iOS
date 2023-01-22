//
//  HeaderProtocol.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/21.
//

import Foundation

protocol SecondEtcButtonProtocol{
    var secondEtcButton: EtcButton { get }
}

extension SecondEtcButtonProtocol where Self: BaseHeaderView{
    func setSecondEtcButtonLayout(){
        self.addSubview(secondEtcButton)
        secondEtcButton.snp.makeConstraints{
            $0.trailing.equalTo(etcButton.snp.leading).offset(-8)
            $0.top.width.height.equalTo(etcButton)
        }
    }
}
