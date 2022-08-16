//
//  TabBarTitleView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/16.
//

import UIKit

class TabBarTitleView: UIView {
    
    let titleLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 18, family: .Bold)
        $0.textColor = .black85
    }
    
    let etcBtn = UIButton()
    
    let titleView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleView)
        
        titleView.addSubview(titleLabel)
        titleView.addSubview(etcBtn)
        
        self.snp.makeConstraints{ make in
            make.height.equalTo(88)
        }
        
        titleView.snp.makeConstraints{ make in
            make.height.equalTo(56)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(25)
            make.centerY.equalToSuperview()
            make.height.equalTo(24)
        }
        
        etcBtn.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
