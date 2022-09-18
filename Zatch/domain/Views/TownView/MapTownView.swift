//
//  TownMapView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/12.
//

import UIKit

class MapTownView: KakaoMapView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        initSetting()
        setUpView()
        setUpConstriant()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSetting(){
        self.settingBtn.setTitle("재치 시작하기", for: .normal)
    }
}
