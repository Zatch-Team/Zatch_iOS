//
//  CheckShareRegisterView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/23.
//

import UIKit

class CheckShareRegisterView: CheckRegisterInfoView {
    
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        
        wantCategory.text = "나눔"
        myProductLabel.textAlignment = .left
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUpView() {
        super.setUpView()
        
        self.addSubview(wantCategory)
    }
    
    override func setUpConstraint(){
        
        super.setUpConstraint()
        
        wantCategory.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(37)
        }
        
        myCategory.snp.makeConstraints{
            $0.leading.equalTo(wantCategory.snp.trailing).offset(4)
        }

        myProductLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(36)
        }
        
        myZatchInfoFrame.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(36)
            $0.trailing.equalToSuperview()
        }
        
    }
    

}
