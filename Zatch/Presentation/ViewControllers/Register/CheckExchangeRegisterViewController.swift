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
        
        mainView.firstWantCategoryTag.setCategoryTitle(categoryId: wantProductInfo.firstPriorityCategory)
        mainView.firstWantProductNameLabel.text = wantProductInfo.firstPriorityName.isEmpty ? "(선제시 후교환)" : wantProductInfo.firstPriorityName
        mainView.secondWantFrame
            .setPriority(
                productName: wantProductInfo.secondPriorityName,
                categoryId: wantProductInfo.secondPriorityCategory
            )
        mainView.thirdWantFrame
            .setPriority(
                productName: wantProductInfo.thirdPriorityName,
                categoryId: wantProductInfo.thirdPriorityCategory
            )
    }
}

