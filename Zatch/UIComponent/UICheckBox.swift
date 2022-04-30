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
        self.titleLabel?.textColor = .black45
        self.layer.cornerRadius = CGFloat(18)
        self.titleLabel?.font = UIFont.pretendard(size: 13, family: .Medium)
        self.layoutMargins = UIEdgeInsets(top: 0, left: 8, bottom: 12, right: 8)
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
        self.addTarget(self, action: #selector(check), for: .touchUpInside)
        self.isChecked = false
    }
    
    @objc func check(_sender : UIGestureRecognizer){
        isChecked.toggle()
    }
    
    private func setChecked(_ isChecked: Bool){
        if isChecked == true{
            titleLabel?.textColor = .zatchYellow
            self.titleLabel?.font = UIFont.pretendard(size: 13, family: .Bold)
        }else{
            titleLabel?.textColor = .black45
        }
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
}
