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
        
        self.setImage(UIImage(named: "zatch_uncheck"), for: .normal)
        self.setImage(UIImage(named: "zatch_check"), for: .selected)

    }
    
}
