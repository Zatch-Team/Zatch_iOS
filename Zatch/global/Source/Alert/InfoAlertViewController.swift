//
//  InfoAlertViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/08.
//

import UIKit

class InfoAlertViewController: MessageAlertViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        settingOkBtnWhiteBackground()
        
        setUpView()
        setUpConstraint()
    }
    
    override func setUpConstraint(){
        
        super.setUpConstraint()
        
        messageLabel.snp.updateConstraints{
            $0.top.equalToSuperview().offset(22)
        }
        
        btnStackView.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-30)
            make.top.equalTo(messageLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }

}
