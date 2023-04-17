//
//  CheckExchangeRegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/23.
//

import UIKit

class CheckExchangeRegisterViewController: CheckRegisterViewController {
    
    init(myProductInfo: RegisterFirstInformationDTO, wantProductInfo: RegisterSecondInformationDTO){
        super.init(myProductInfo: myProductInfo,
                   wantProductInfo: wantProductInfo,
                   infoView: CheckExchangeRegisterInfoView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

