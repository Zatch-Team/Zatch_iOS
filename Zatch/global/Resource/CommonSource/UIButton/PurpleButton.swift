//
//  PurpleButton.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/05.
//

import UIKit

class PurpleButton: UIButton{
    
    init(){
        
        super.init(frame: CGRect.zero)
        
        self.backgroundColor = .zatchPurple
        
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.pretendard(family: .Bold)
        
        self.layer.cornerRadius = 36/2
        
        self.titleEdgeInsets = UIEdgeInsets(top: 9, left: 0, bottom: 9, right: 0)
        
        self.snp.makeConstraints{ make in
            make.height.equalTo(36)
        }
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
}
