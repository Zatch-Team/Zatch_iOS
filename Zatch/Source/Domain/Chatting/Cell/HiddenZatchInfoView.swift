//
//  HiddenZatchInfoView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/16.
//

import UIKit

class HiddenZatchInfoView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .zatchPurple
        
        self.snp.makeConstraints{ make in
            make.height.equalTo(80)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
