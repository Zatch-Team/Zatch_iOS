//
//  BaseHeaderView.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/21.
//

import Foundation

class BaseHeaderView: BaseView{
    
    let backButton = UIButton().then{
        $0.setImage(Image.arrowLeft, for: .normal)
    }
    
    override func hierarchy() {
        self.addSubview(backButton)
    }
    
    override func layout() {
        
        self.snp.makeConstraints{
            $0.height.equalTo(60)
        }
        
        backButton.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(14)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(backButton.snp.height)
        }
    }
}

