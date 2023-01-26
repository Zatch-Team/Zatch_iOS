//
//  BaseNavigationTitleHeaderView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/26.
//

import Foundation

protocol HeaderNavigationTitle{
    var title: String { get }
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
    let title: String
    let navigationTitleLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 20, family: .Bold)
    }
    
    init(title: String){
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func style() {
        navigationTitleLabel.text = title
    }
    
    override func layout() {
        super.layout()
        layoutNavigationTitle()
    }
}

class LeftNavigationTitleHeaderView: BaseHeaderView, HeaderNavigationTitle{
    let title: String
    let navigationTitleLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 20, family: .Bold)
    }
    
    init(title: String){
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func style() {
        navigationTitleLabel.text = title
    }
    
    override func layout() {
        super.layout()
        layoutNavigationTitle()
    }
}
