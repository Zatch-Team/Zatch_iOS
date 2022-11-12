//
//  ZatchRoundCheck.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/29.
//

import UIKit

class ZatchRoundCheck: UIButton {
    
    init(){
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit(){
        
        self.setImage(Image.zatchUncheck, for: .normal)
        self.setImage(Image.zatchCheck, for: .selected)

    }
    
}
