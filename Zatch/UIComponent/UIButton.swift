//
//  UIButton.swift
//  Zatch
//
//  Created by 박지윤 on 2022/04/30.
//

import UIKit

class purpleButton: UIButton{
    
    init(){
        super.init(frame: CGRect.zero)
        self.backgroundColor = .zatchPurple
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = UIFont.pretendard(family: .Bold)
        self.layer.cornerRadius = CGFloat(18)
        self.layoutMargins = UIEdgeInsets(top: 184, left: 74, bottom: 12, right: 74)
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
}
