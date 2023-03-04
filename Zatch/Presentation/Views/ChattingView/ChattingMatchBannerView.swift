//
//  ChattingMatchBannerView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/21.
//

import UIKit

extension ChattingRoomView{
    class ChattingMatchBannerView: BaseView {
        
        private let explainLabel = UILabel().then{
            $0.text = "매치가 된 사용자입니다.\n거래 시간과 날짜를 정해주세요."
            $0.setTypoStyleWithMultiLine(typoStyle: .medium14)
            $0.textColor = .black20
            $0.numberOfLines = 2
            $0.textAlignment = .center
        }
        
        let imageView = UIImageView().then{
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
            $0.backgroundColor = .black20
        }
        
        private let zatchInfoFrame = UIStackView().then{
            $0.spacing = 8
        }
        private let exchangeImage = UIImageView().then{
            $0.image = Image.exchange
        }
        let myZatch = UILabel().then{
            $0.text = "수녀님 코스튬"
            $0.setTypoStyleWithSingleLine(typoStyle: .medium15_21)
            $0.textColor = .black85
            $0.textAlignment = .right
        }
        
        let otherZatch = UILabel().then{
            $0.text = "코스튬 아무거나"
            $0.setTypoStyleWithSingleLine(typoStyle: .medium15_21)
            $0.textColor = .black85
        }
        
        private let borderLine = ZatchComponent.BorderLine(color: .black5, height: 1)
        
        override func hierarchy() {
            
            addSubview(explainLabel)
            addSubview(imageView)
            addSubview(zatchInfoFrame)
            addSubview(borderLine)
            
            zatchInfoFrame.addArrangedSubview(myZatch)
            zatchInfoFrame.addArrangedSubview(exchangeImage)
            zatchInfoFrame.addArrangedSubview(otherZatch)
        }
        
        override func layout() {
            explainLabel.snp.makeConstraints{
                $0.top.equalToSuperview().offset(12)
                $0.centerX.equalToSuperview()
            }
            
            imageView.snp.makeConstraints{
                $0.top.equalTo(explainLabel.snp.bottom).offset(12)
                $0.width.height.equalTo(104)
                $0.centerX.equalToSuperview()
            }
            
            zatchInfoFrame.snp.makeConstraints{
                $0.top.equalTo(imageView.snp.bottom).offset(12)
                $0.leading.trailing.equalToSuperview().inset(15)
            }
            
            exchangeImage.snp.makeConstraints{
                $0.width.height.equalTo(24)
                $0.centerX.equalTo(imageView)
            }
            
            borderLine.snp.makeConstraints{
                $0.top.equalTo(zatchInfoFrame.snp.bottom).offset(12)
                $0.leading.trailing.equalToSuperview().inset(15)
                $0.bottom.equalToSuperview()
            }
        }
        
    }
}
