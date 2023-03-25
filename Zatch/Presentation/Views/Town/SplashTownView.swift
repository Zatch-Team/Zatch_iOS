//
//  TownSplashView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/12.
//

import UIKit

class SplashTownView: BaseView {
    
    private let splashImage = UIImageView().then{
        $0.image = Image.townSplash
        $0.contentMode = .scaleAspectFit
    }
    
    private let titleLabel = UILabel().then{
        $0.text = "1인가구의 재치있는\n자취 커뮤니티"
        $0.font = UIFont.rixYeoljeongdo(size: 24)
        $0.numberOfLines = 0
        $0.setTextWithLineHeight(lineHeight: 32)
        $0.textAlignment = .center
    }

    private let explainLabel = UILabel().then{
        $0.text = "내 자취방 근처 교환 물품과\n새로운 소식을 발 빠르게 확인하세요!"
        $0.setTypoStyleWithMultiLine(typoStyle: .medium16)
        $0.textColor =  UIColor(r: 137, g: 137, b: 137, alpha: 1)
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    
    lazy var moveSettingBtn = Purple52Button(title: "내 위치 설정하기")
    
    override func hierarchy() {
        addSubview(splashImage)
        addSubview(titleLabel)
        addSubview(explainLabel)
        addSubview(moveSettingBtn)
    }
    
    override func layout() {
        splashImage.snp.makeConstraints{
//            $0.top.equalToSuperview().offset(244)
            $0.leading.equalToSuperview().offset(80)
            $0.trailing.equalToSuperview().inset(69)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(splashImage.snp.bottom).offset(52)
            $0.centerX.equalToSuperview()
        }
        
        explainLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        moveSettingBtn.snp.makeConstraints{
            $0.top.equalTo(explainLabel.snp.bottom).offset(54)
            $0.bottom.equalToSuperview().inset(86)
            $0.leading.trailing.equalToSuperview().inset(31)
        }
        
    }
    
}
