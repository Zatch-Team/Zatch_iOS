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
    func layoutNavigationTitle()
}

extension HeaderNavigationTitle{
    
    func layoutNavigationTitle() where Self: CenterNavigationHeaderView{
        self.addSubview(navigationTitleLabel)
        navigationTitleLabel.snp.makeConstraints{
            $0.centerY.centerX.equalToSuperview()
        }
    }
    
    func layoutNavigationTitle() where Self: LeftNavigationHeaderView{
        self.addSubview(navigationTitleLabel)
        navigationTitleLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.backButton.snp.trailing).offset(8)
        }
    }
}
