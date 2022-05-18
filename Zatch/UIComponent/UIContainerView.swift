//
//  UIContainerView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/02.
//

import Foundation
import UIKit

class TopTitleView: UIView{
    
    let titleText = TitleLabel()
    
    init(){
        super.init(frame: CGRect.zero)
        
        self.snp.makeConstraints{ make in
            make.height.equalTo(88)
        }
        self.addSubview(titleText)
        
        titleText.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(28)
        }
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
}
