//
//  UIButton.swift
//  Zatch
//
//  Created by 박지윤 on 2022/04/30.
//

import UIKit

class SearchBSButton: UIButton{
    
    var serviceType: SearchBS?
    
    init(_ searchBS: SearchBS){
        
        super.init(frame: CGRect.zero)
        
        serviceType = searchBS
        
        if(serviceType == SearchBS.Register){
            
            self.setBackgroundColor(.zatchYellow40, for: .normal)
            self.setBackgroundColor(.zatchYellow, for: .selected)
            
            self.titleLabel?.textColor = .zatchDeepYellow
            
        }else{
            self.setBackgroundColor(.zatchPurple40, for: .normal)
            self.setBackgroundColor(.zatchPurple, for: .selected)
            
            self.titleLabel?.textColor = .zatchPurple
        }

        unSelectState()
        
        self.layer.cornerRadius = CGFloat(14)
        self.titleEdgeInsets = UIEdgeInsets(top: 5.5, left: 12, bottom: 5.5, right: 12)
        
        self.snp.makeConstraints{ make in
            make.height.equalTo(28)
        }
    }
    
    func unSelectState(){
        
        self.titleLabel?.font = UIFont.pretendard(family: .Medium)
        
        if(serviceType == SearchBS.Register){
            self.titleLabel?.textColor = .zatchDeepYellow
        }else{
            self.titleLabel?.textColor = .zatchPurple
        }
    }
    
    func selectState(){
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = UIFont.pretendard(family: .Bold)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
}
