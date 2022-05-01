//
//  UICheckBox.swift
//  Zatch
//
//  Created by 박지윤 on 2022/04/30.
//

import Foundation
import UIKit

class SearchVCCheckBox : UIButton{
    
    init(){
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    var isChecked: Bool = false {
        didSet{
            guard isChecked != oldValue else{
                return
            }
            self.setChecked(isChecked)
        }
    }
    
    private func commonInit(){
        
        self.isChecked = false
        self.layer.cornerRadius = CGFloat(15)
        self.isEnabled = true
        
        self.addTarget(self, action: #selector(check), for: .touchUpInside)
        
        uncheckedState()
    }
    
    @objc func check(_sender : UIGestureRecognizer){
        isChecked.toggle()
    }
    
    private func setChecked(_ isChecked: Bool){
        if isChecked == true{
            checkedState()
        }else{
            uncheckedState()
        }
    }
    
    private func checkedState(){
        self.setTitleColor(.zatchYellow, for: .normal)
        self.titleLabel?.font = UIFont.pretendard(size: 13, family: .Bold)
        self.layer.borderColor = UIColor.zatchYellow.cgColor
        self.layer.borderWidth = 1.5
    }
    
    private func uncheckedState(){
        self.setTitleColor(.black45, for: .normal)
        self.titleLabel?.font = UIFont.pretendard(size: 13, family: .Medium)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black45.cgColor
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
        commonInit()
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
}
