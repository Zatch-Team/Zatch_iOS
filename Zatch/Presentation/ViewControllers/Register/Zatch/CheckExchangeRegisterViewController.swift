//
//  CheckExchangeRegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/23.
//

import UIKit

class CheckExchangeRegisterViewController: CheckRegisterViewController {

    init(){
        super.init(infoView: CheckExchangeRegisterView())
    }
    
    required init?(coder: NSCoder) {
        super.init(infoView: CheckExchangeRegisterView())
    }
    
}
