//
//  CheckExchangeRegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/23.
//

import UIKit

class CheckExchangeRegisterViewController: CheckRegisterViewController {
    
    private let wantProductInfo: RegisterSecondInformationDTO
    
    init(myProductInfo: RegisterFirstInformationDTO, wantProductInfo: RegisterSecondInformationDTO){
        self.wantProductInfo = wantProductInfo
        super.init(myProductInfo: myProductInfo,
                   infoView: CheckExchangeRegisterInfoView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

