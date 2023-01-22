//
//  TabBarHeaderView.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/21.
//

import Foundation

class TabBarHeaderView: BaseHeaderView, TabBarHeaderProtocol{
    
    let title: String
    let tabBarTitleLabel = UILabel().then{
        $0.setTypoStyleWithSingleLine(typoStyle: .bold18)
        $0.textColor = .black85
    }
    
    //MARK: - Generator
    
    init(title: String, etcButton: UIImage){
        self.title = title
        super.init(image: etcButton)
    }
    
    init(title: String, etcButton: String){
        self.title = title
        super.init(title: etcButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Override
    
    override func style() {
        self.tabBarTitleLabel.text = title
    }
    
    override func hierarchy() {
        super.hierarchy()
        self.addSubview(tabBarTitleLabel)
    }
    
    override func layout() {
        super.layout()
        tabBarTitleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(24)
            $0.centerY.equalToSuperview()
        }
    }
}
