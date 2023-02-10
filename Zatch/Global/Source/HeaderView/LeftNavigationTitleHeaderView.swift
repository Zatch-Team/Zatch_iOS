//
//  LeftNavigationTitleHeaderView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/28.
//

import Foundation

class LeftNavigationHeaderView: BaseHeaderView, HeaderNavigationTitle{
    
    let title: String
    let navigationTitleLabel = UILabel()

    required init(title: String){
        self.title = title
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func style() {
        setNavigationTitleLabelAttribute(typo: .bold20)
    }
    
    override func hierarchy() {
        super.hierarchy()
        self.addSubview(navigationTitleLabel)
    }
    
    override func layout() {
        super.layout()
        navigationTitleLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.backButton.snp.trailing).offset(8)
        }
    }
}
