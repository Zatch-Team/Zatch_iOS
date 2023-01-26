//
//  MyZatchTabBarHeaderView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/26.
//

import Foundation

class MyZatchTabBarHeaderView: BaseTabBarHeaderView, HeaderSecondEtcButton{
    
    var secondEtcButton: EtcButton
    
    init(){
        self.secondEtcButton = EtcButton(image: Image.search)
        super.init(title: "나의 재치", button: Image.bell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        super.layout()
        setSecondEtcButtonLayout()
    }
}
