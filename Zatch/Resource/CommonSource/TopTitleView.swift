//
//  UIContainerView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/02.
//

import Foundation
import UIKit

class TopTitleView: UIView{
    
    let titleLabel = UILabel().then{
        $0.numberOfLines = 0
        $0.font = UIFont.pretendard(size: 20, family: .Bold)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        self.snp.makeConstraints{ make in
            make.height.equalTo(88)
        }
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(28)
        }
    }
}
