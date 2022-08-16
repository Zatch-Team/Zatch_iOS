//
//  HiddenDeleteView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/16.
//

import UIKit

class HiddenDeleteView: UIView {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red: 234/255, green: 39/255, blue: 13/255, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
