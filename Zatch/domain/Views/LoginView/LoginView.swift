//
//  LoginView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/11/11.
//

import UIKit

class LoginView: BaseView {
    
    //MARK: - UI
    let logoImage = UIImageView().then{
        $0.image = UIImage(named: "login_character")
    }
    
    lazy var kakaoBtn = UIButton().then{
        $0.layer.cornerRadius = 52/2
        $0.backgroundColor = UIColor(red: 250/255, green: 225/255, blue: 0, alpha: 1)
    }
    
    let kakaoStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 12.5
        $0.isUserInteractionEnabled = false
    }
    
    let kakaoLogo = UIImageView().then{
        $0.image = UIImage(named: "kakao_logo")
    }
    
    let kakaoLabel = UILabel().then{
        $0.text = "카카오톡 간편로그인"
        $0.textColor = UIColor(red: 57/255, green: 32/255, blue: 32/255, alpha: 1)
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }
    
    //MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Override
    
    override func hierarchy() {
        
        self.addSubview(logoImage)
        self.addSubview(kakaoBtn)
        
        kakaoBtn.addSubview(kakaoStackView)
        
        kakaoStackView.addArrangedSubview(kakaoLogo)
        kakaoStackView.addArrangedSubview(kakaoLabel)
    }
    
    override func layout() {
        
        logoImage.snp.makeConstraints{
            $0.width.equalTo(166)
            $0.top.equalToSuperview().offset(294)
            $0.leading.equalToSuperview().offset(110)
            $0.trailing.equalToSuperview().offset(-114)
        }
        
        kakaoBtn.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-86)
            $0.leading.equalToSuperview().offset(16)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoImage.snp.bottom).offset(169)
            $0.height.equalTo(52)
        }
        
        kakaoStackView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview().offset(2)
        }
        
        
    }
}
