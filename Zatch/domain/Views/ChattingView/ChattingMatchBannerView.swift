//
//  ChattingMatchBannerView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/21.
//

import UIKit

class ChattingMatchBannerView: UIView {
    
    let explainLabel = UILabel().then{
        $0.text = "매치가 된 사용자입니다.\n거래 시간과 날짜를 정해주세요."
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textColor = .black20
    }
    
    let imageView = UIImageView().then{
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        
        $0.backgroundColor = .black20
    }
    
    let exchangeImage = UIImageView().then{
        $0.image = UIImage(named: "exchange")
    }
    
    let myZatch = UILabel().then{
        $0.text = "수녀님 코스튬"
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textColor = .black85
        $0.textAlignment = .right
    }
    
    let otherZatch = UILabel().then{
        $0.text = "코스튬 아무거나"
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textColor = .black85
    }
    
    let zatchInfoFrame = UIStackView().then{
        $0.spacing = 16
        $0.alignment = .center
    }
    
    let borderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        
        setUpValue()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpValue(){
        
        self.addSubview(explainLabel)
        self.addSubview(imageView)
        self.addSubview(zatchInfoFrame)
        self.addSubview(borderLine)
        
        zatchInfoFrame.addArrangedSubview(myZatch)
        zatchInfoFrame.addArrangedSubview(exchangeImage)
        zatchInfoFrame.addArrangedSubview(otherZatch)
    }
    
    func setUpConstraint(){
        
        self.snp.makeConstraints{ make in
            make.height.equalTo(172)
        }
        
        explainLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(12)
            make.centerX.equalToSuperview()
        }
        
        imageView.snp.makeConstraints{ make in
            make.width.height.equalTo(72)
            make.centerX.equalToSuperview()
            make.top.equalTo(explainLabel.snp.bottom).offset(12)
        }
        
        zatchInfoFrame.snp.makeConstraints{ make in
            make.top.equalTo(imageView.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
        }
        
        exchangeImage.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
        }
        
        borderLine.snp.makeConstraints{ make in
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

}
