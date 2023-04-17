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
    
    override func initialize() {
        super.initialize()
        bindingWantProductData()
    }
    
    private func bindingWantProductData(){
        
        guard let mainView = mainView.infoFrame as? CheckExchangeRegisterInfoView else { fatalError("type error") }
        
        mainView.firstWantCategoryTag.setCategoryTitle(categoryId: wantProductInfo.firstPriority!.p_category)
        mainView.firstWantProductNameLabel.text = wantProductInfo.firstPriority?.p_name
        mainView.secondWantFrame.setInformation(wantProductInfo.secondPriority)
        mainView.thirdWantFrame.setInformation(wantProductInfo.thirdPriority)
    }
}

