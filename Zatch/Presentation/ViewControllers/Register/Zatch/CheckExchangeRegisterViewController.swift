//
//  CheckExchangeRegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/23.
//

import UIKit

class CheckExchangeRegisterViewController: CheckRegisterViewController {

    init(){
        super.init(infoView: CheckExchangeRegisterInfoView())
    }
    
    required init?(coder: NSCoder) {
        super.init(infoView: CheckExchangeRegisterInfoView())
    }
    
}

