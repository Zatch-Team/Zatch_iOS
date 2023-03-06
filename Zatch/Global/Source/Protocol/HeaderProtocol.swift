//
//  HeaderProtocol.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/21.
//

import Foundation

//MARK: - FirstEtcButton
protocol HeaderFirstEtcButton{
    var etcButton: EtcButton { get }
    func setEtcButtonLayout()
}

extension HeaderFirstEtcButton where Self: BaseView{
    func setEtcButtonLayout(){
        self.addSubview(etcButton)
        etcButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalToSuperview().offset(14)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(etcButton.snp.height)
        }
    }
}

extension HeaderFirstEtcButton where Self: BaseTabBarHeaderView{
    func setEtcButtonLayout(){
        self.addSubview(etcButton)
        etcButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(etcButton.snp.height)
        }
    }
}

extension HeaderFirstEtcButton where Self: MainHeaderView{
    func setEtcButtonLayout(){
        self.addSubview(etcButton)
        etcButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(etcButton.snp.height)
        }
    }
}

//MARK: - SecondEtcButton
protocol HeaderSecondEtcButton{
    var secondEtcButton: EtcButton { get }
}

extension HeaderSecondEtcButton where Self: HeaderFirstEtcButton, Self: BaseView{
    func setSecondEtcButtonLayout(){
        self.addSubview(secondEtcButton)
        secondEtcButton.snp.makeConstraints{
            $0.trailing.equalTo(etcButton.snp.leading).offset(-8)
            $0.top.width.height.equalTo(etcButton)
        }
    }
}

//MARK: - NavigationTitle

protocol HeaderNavigationTitle{
    var title: String { get }
    var navigationTitleLabel: UILabel { get }
    init(title: String)
}

extension HeaderNavigationTitle{
    func setNavigationTitleLabelAttribute(typo: TypoStyle){
        navigationTitleLabel.text = title
        navigationTitleLabel.setTypoStyleWithSingleLine(typoStyle: typo)
    }
}
