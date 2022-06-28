//
//  UIButton.swift
//  Zatch
//
//  Created by 박지윤 on 2022/04/30.
//

import UIKit

extension UIButton {
    
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))

        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        setBackgroundImage(backgroundImage, for: state)
    }
}

class PurpleButton: UIButton{
    
    init(){
        super.init(frame: CGRect.zero)
        self.backgroundColor = .zatchPurple
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = UIFont.pretendard(family: .Bold)
        self.layer.cornerRadius = CGFloat(16)
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

class NavigationBackButton: UIBarButtonItem{
    
    override init(){
        super.init()
        self.tintColor = .black
        self.image = UIImage(named: "arrow_left")
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    init(frame: CGRect){
        super.init()
    }
}

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
