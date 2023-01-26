//
//  BaseTabBarHeaderView.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/21.
//

import Foundation

protocol TabBarHeaderProtocol{
    var title: String { get }
    var tabBarTitleLabel: UILabel { get }
}

class BaseTabBarHeaderView: BaseView, TabBarHeaderProtocol, HeaderFirstEtcButton{
    
    let title: String
    let tabBarTitleLabel = UILabel().then{
        $0.setTypoStyleWithSingleLine(typoStyle: .bold18)
        $0.textColor = .black85
    }
    let etcButton: EtcButton
    
    //MARK: - Generator
    
    init(title: String, button image: UIImage){
        self.title = title
        self.etcButton = EtcButton(image: image)
        super.init(frame: .zero)
    }
    
    init(title: String, button text: String){
        self.title = title
        self.etcButton = EtcButton(title: text)
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func style() {
        tabBarTitleLabel.text = title
    }
    
    override func hierarchy() {
        self.addSubview(tabBarTitleLabel)
    }
    
    override func layout() {
        
        self.snp.makeConstraints{
            $0.height.equalTo(60)
        }
        
        tabBarTitleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(24)
            $0.centerY.equalToSuperview()
        }
        
        setEtcButtonLayout()
    }
}

