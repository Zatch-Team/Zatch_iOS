//
//  UIButton.swift
//  Zatch
//
//  Created by 박지윤 on 2022/04/30.
//

import UIKit

class PurpleButton: UIButton{
    
    init(){
        super.init(frame: CGRect.zero)
        self.backgroundColor = .zatchPurple
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = UIFont.pretendard(family: .Bold)
        self.layer.cornerRadius = CGFloat(16)
        self.titleEdgeInsets = UIEdgeInsets(top: 9, left: 0, bottom: 9, right: 0)

        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
}
