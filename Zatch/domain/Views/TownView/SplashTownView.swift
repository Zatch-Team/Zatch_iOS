//
//  TownSplashView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/12.
//

import UIKit

class SplashTownView: UIView {
    
    let splashImage = UIImageView().then{
        $0.image = UIImage(named: "town_splash")
        $0.contentMode = .scaleAspectFit
    }
    
    let titleLabel = UILabel().then{
        $0.text = "1인가구의 재치있는\n자취 커뮤니티"
        $0.font = UIFont.rixYeoljeongdo(size: 24)
        $0.numberOfLines = 0
        $0.setTextWithLineHeight(lineHeight: 32)
        $0.textAlignment = .center
    }

    let explainLabel = UILabel().then{
        $0.text = "내 자취방 근처 교환 물품과\n새로운 소식을 발 빠르게 확인하세요!"
        $0.font = UIFont.pretendard(size: 16, family: .Medium)
        $0.numberOfLines = 0
        $0.textColor = UIColor(red: 137/255, green: 137/255, blue: 137/255, alpha: 1)
        $0.setTextWithLineHeight(lineHeight: 20)
        $0.textAlignment = .center
    }
    
    lazy var moveSettingBtn = PurpleButton(height: 52, fontSize: 18).then{
        $0.setTitle("내 위치 설정하기", for: .normal)
    }

    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        self.addSubview(splashImage)
        self.addSubview(titleLabel)
        self.addSubview(explainLabel)
        self.addSubview(moveSettingBtn)
    }
    
    func setUpConstraint(){
        
        splashImage.snp.makeConstraints{
//            $0.top.equalToSuperview().offset(244)
            $0.leading.equalToSuperview().offset(80)
            $0.trailing.equalToSuperview().offset(-69)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(splashImage.snp.bottom).offset(52)
            $0.centerX.equalToSuperview().offset(1)
        }
        
        explainLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        moveSettingBtn.snp.makeConstraints{
            $0.top.equalTo(explainLabel.snp.bottom).offset(52)
            $0.bottom.equalToSuperview().offset(-86)
            $0.leading.equalToSuperview().offset(31)
            $0.trailing.equalToSuperview().offset(-31)
        }
        
    }
    
}
