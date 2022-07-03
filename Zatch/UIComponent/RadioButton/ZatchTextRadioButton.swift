//
//  ZatchRadioButton.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/29.
//

import UIKit

class ZatchTextRadioButton: UIButton {

    init(){
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit(){
    
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.titleLabel?.font = UIFont.pretendard(size: 12, family: .Medium)
        
        self.setBackgroundColor(.black10, for: .normal)
        self.setBackgroundColor(.zatchPurple40, for: .selected)
        
        self.setTitleColor(.black20, for: .normal)
        self.setTitleColor(.zatchPurple, for: .selected)
    }

}
