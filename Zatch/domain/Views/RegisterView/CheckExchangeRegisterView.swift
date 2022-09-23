//
//  CheckExchangeRegisterView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/23.
//

import UIKit

class CheckExchangeRegisterView: CheckRegisterInfoView {
    
    let exchangeImage = UIImageView().then{
        $0.image = UIImage(named: "exchange")
    }
    
    //want
    let myFrame = UIView()
    let wantFrame = UIView()
    
    let firstWantCategory = PaddingLabel().then{
        $0.text = "생활용품"
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textColor = .zatchDeepYellow
        $0.backgroundColor = .yellow40
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20/2
    }
    
    let firstWantProduct = UILabel().then{
        $0.text = "맥도날드 해피밀 마이멜로디 장난감"
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }
    
    let secondWantFrame = WantProductInfoView().then{
        $0.rankLabel.text = "2순위"
        $0.categoryLabel.text = "생활용품"
        $0.productLabel.text = "신상 햄스터 말랑이"
    }
    
    let thirdWantFrame = WantProductInfoView().then{
        $0.rankLabel.text = "3순위"
        $0.categoryLabel.text = "생활용품"
        $0.productLabel.text = "신상 햄스터 고양이 강아지 모양 말랑이"
    }
    
    let secondThirdStackView = UIStackView().then{
        $0.spacing = 13
        $0.axis = .vertical
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        
        myProductLabel.textAlignment = .center
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUpView(){
        
        super.setUpView()
        
        self.addSubview(wantFrame)
        self.addSubview(exchangeImage)
        self.addSubview(myFrame)
        
        wantFrame.addSubview(firstWantCategory)
        wantFrame.addSubview(firstWantProduct)
        wantFrame.addSubview(secondThirdStackView)
        
        secondThirdStackView.addArrangedSubview(secondWantFrame)
        secondThirdStackView.addArrangedSubview(thirdWantFrame)
        
        myFrame.addSubview(myCategory)
        myFrame.addSubview(myProductLabel)
        myFrame.addSubview(myZatchInfoFrame)
        
    }
    
    override func setUpConstraint(){
        
        super.setUpConstraint()
        
        exchangeImage.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(23)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        wantFrame.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(23)
            make.trailing.equalTo(exchangeImage.snp.leading)
        }
        
        firstWantCategory.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
        
        firstWantProduct.snp.makeConstraints{ make in
            make.top.equalTo(firstWantCategory.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(32)
        }
        
        secondThirdStackView.snp.makeConstraints{ make in
            make.top.equalTo(firstWantProduct.snp.bottom).offset(11)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().offset(-4)
        }
        
        //
        myFrame.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-24)
            make.leading.equalTo(exchangeImage.snp.trailing).offset(20)
        }
        
        myCategory.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(16)
            make.centerX.equalTo(myProductLabel)
            make.height.equalTo(20)
        }
        
        myProductLabel.snp.makeConstraints{ make in
            make.top.equalTo(myCategory.snp.bottom).offset(5)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().offset(-11)
            make.height.equalTo(32)
        }
        
    }
    
}

extension CheckExchangeRegisterView{
    
    class WantProductInfoView: UIView{
        
        let rankLabel = UILabel().then{
            $0.font = UIFont.pretendard(size: 12, family: .Bold)
            $0.textColor = .zatchDeepYellow
            $0.textAlignment = .center
        }
        
        let productLabel = UILabel().then{
            $0.numberOfLines = 2
            $0.font = UIFont.pretendard(size: 12, family: .Medium)
            $0.textColor = .black85
            $0.textAlignment = .left
        }
        
        let categoryLabel = UILabel().then{
            $0.textColor = .black20
            $0.font = UIFont.pretendard(size: 10, family: .Medium)
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
            self.addSubview(rankLabel)
            self.addSubview(productLabel)
            self.addSubview(categoryLabel)
        }
        
        func setUpConstraint(){
            
            rankLabel.snp.makeConstraints{
                $0.height.equalTo(17)
                $0.width.equalTo(39)
                $0.leading.top.equalToSuperview()
            }
            
            categoryLabel.snp.makeConstraints{
                $0.top.equalTo(rankLabel.snp.bottom)
                $0.leading.equalToSuperview().offset(4)
                $0.height.equalTo(13)
                $0.width.equalTo(39)
                $0.bottom.equalToSuperview().offset(-2)
            }
            
            productLabel.snp.makeConstraints{
                $0.top.trailing.equalToSuperview()
                $0.leading.equalTo(rankLabel.snp.trailing).offset(9)
            }
        }
    }

}
