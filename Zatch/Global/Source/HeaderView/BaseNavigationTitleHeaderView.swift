//
//  BaseNavigationTitleHeaderView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/26.
//

import Foundation

protocol HeaderNavigationTitle{
    var navigationTitleLabel: UILabel { get }
    func layoutNavigationTitle()
}

extension HeaderNavigationTitle{
    
    func layoutNavigationTitle() where Self: BaseNavigationTitleHeaderView{
        self.addSubview(navigationTitleLabel)
        navigationTitleLabel.snp.makeConstraints{
            $0.centerY.centerX.equalToSuperview()
        }
    }
    
    func layoutNavigationTitle() where Self: LeftNavigationTitleHeaderView{
        self.addSubview(navigationTitleLabel)
        navigationTitleLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.backButton.snp.trailing).offset(8)
        }
    }
}

class BaseNavigationTitleHeaderView: BaseHeaderView, HeaderNavigationTitle{
    
    let navigationTitleLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 20, family: .Bold)
    }
    
    override func layout() {
        super.layout()
        layoutNavigationTitle()
    }
}

class LeftNavigationTitleHeaderView: BaseHeaderView, HeaderNavigationTitle{
    
    let navigationTitleLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 20, family: .Bold)
    }
    
    override func layout() {
        super.layout()
        layoutNavigationTitle()
    }
}
