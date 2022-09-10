//
//  BasicAlertViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/14.
//

import UIKit

class BasicAlertViewController: MessageAlertViewController {
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        settingOkBtnPurpleBackground()
        
    }

    override func setUpConstraint(){
        
        super.setUpConstraint()
        
        btnStackView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(messageLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}
