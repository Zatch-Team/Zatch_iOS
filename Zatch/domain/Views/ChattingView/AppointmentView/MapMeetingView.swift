//
//  MapMeetingView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/18.
//

import UIKit

class MapMeetingView: KakaoMapView {
    
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
        self.settingBtn.setTitle("약속 잡기", for: .normal)
    }

}
