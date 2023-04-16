//
//  CheckShareRegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/23.
//

import UIKit

class CheckShareRegisterViewController: CheckRegisterViewController {
    
    private let wantProductInfo: RegisterSecondInformationDTO
    
    init(myProductInfo: RegisterFirstInformationDTO, wantProductInfo: RegisterSecondInformationDTO){
        self.wantProductInfo = wantProductInfo
        super.init(myProductInfo: myProductInfo,
                   infoView: CheckShareRegisterInfoView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func bind() {
        commentObservable
            .subscribe(onNext: {
                print("comment check",$0)
            }).disposed(by: disposeBag)
    }
}
