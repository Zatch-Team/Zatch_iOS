//
//  UILabel.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/02.
//

import Foundation
import UIKit

class TitleLabel: UILabel {
    
    init(){
        super.init(frame: CGRect.zero)
        self.textColor = .black
        self.font = UIFont.pretendard(size: 20, family: .Bold)
        self.numberOfLines = 0
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
}
