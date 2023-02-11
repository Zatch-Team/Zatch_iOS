//
//  CheckShareRegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/23.
//

import UIKit

class CheckShareRegisterViewController: CheckRegisterViewController {
    
    init(){
        super.init(infoView: CheckShareRegisterView())
    }
    
    required init?(coder: NSCoder) {
        super.init(infoView: CheckShareRegisterView())
    }
    
}
