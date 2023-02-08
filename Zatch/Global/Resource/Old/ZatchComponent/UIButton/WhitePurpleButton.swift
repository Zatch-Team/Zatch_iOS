//
//  WhitePurpleButton.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/10.
//

import UIKit

class WhitePurpleButton: UIButton {
    
    init(){
        super.init(frame: CGRect.zero)
        
        self.backgroundColor = .white
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.zatchPurple.cgColor
        
        self.layer.cornerRadius = 36/2
        
        self.setTitleColor(.zatchPurple, for: .normal)
        self.titleLabel?.font = UIFont.pretendard(size: 14, family: .Bold)
        
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
