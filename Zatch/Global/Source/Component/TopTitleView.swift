//
//  TopTitleView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/02.
//

import Foundation
import UIKit

class TopTitleView: BaseView{
    
    private let titleLabel = UILabel().then{
        $0.numberOfLines = 0
        $0.font = UIFont.pretendard(size: 22, family: .Bold)
    }
    
    init(title: String){
        self.titleLabel.text = title
        super.init(frame: .zero)
    }
    
    override func hierarchy() {
        self.addSubview(titleLabel)
    }
    
    override func layout() {
        self.snp.makeConstraints{
            $0.height.equalTo(120)
        }
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(28)
        }
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }
}
