//
//  PurpleButton.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/05.
//

import UIKit

class PurpleButton: UIButton{
    
    init(title: String, height: CGFloat, fontSize: CGFloat){
        
        super.init(frame: CGRect.zero)
        
        self.backgroundColor = .zatchPurple
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.pretendard(size: fontSize, family: .Bold)
        
        self.layer.cornerRadius = height/2
        
        self.snp.makeConstraints{ make in
            make.height.equalTo(height)
        }
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }
}

class Purple36Button: PurpleButton{
    
    init(){
        super.init(title: "", height: 36, fontSize: 14)
    }
    
    init(title: String){
        super.init(title: title, height: 36, fontSize: 14)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Purple52Button: PurpleButton{

    init(){
        super.init(title: "", height: 52, fontSize: 18)
    }
    
    init(title: String){
        super.init(title: title, height: 52, fontSize: 18)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
