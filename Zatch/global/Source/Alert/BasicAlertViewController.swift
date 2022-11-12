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

    override func layout(){
        
        super.layout()
        
        btnStackView.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}
