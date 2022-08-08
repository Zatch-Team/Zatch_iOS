//
//  SearchCateogryButton.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/07.
//

import UIKit

class SearchCateogryDotButton: UIButton {

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
        self.isEnabled = true
        self.setImage(UIImage(named: "search_dot"), for: .normal)
        
        self.addTarget(self, action: #selector(check), for: .touchUpInside)
        
    }
    
    @objc func check(_sender : UIGestureRecognizer){
        isChecked.toggle()
    }
    
    private func setChecked(_ isChecked: Bool){
        if isChecked == false{
            self.setImage(UIImage(named: "search_dot"), for: .normal)
        }else{
            self.setImage(UIImage(named: "search_dot_checked"), for: .normal)
        }
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
