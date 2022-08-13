//
//  CheckRegisterZatchInfoView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/11.
//

import UIKit

class CheckRegisterZatchInfoView: UIView {
    
    let exchangeImage = UIImageView().then{
        $0.image = UIImage(named: "exchange")
    }
    
    //want
    let wantFrame = UIView()
    
    let secondWantTitle = UILabel().then{
        $0.text = "2순위"
        $0.font = UIFont.pretendard(size: 12, family: .Bold)
        $0.textColor = .zatchDeepYellow
        $0.textAlignment = .center
    }
    let thirdWantTitle = UILabel().then{
        $0.text = "3순위"
        $0.font = UIFont.pretendard(size: 12, family: .Bold)
        $0.textColor = .zatchDeepYellow
        $0.textAlignment = .center
    }
    
    let firstWantCategory = PaddingLabel().then{
        $0.text = "생활용품"
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textColor = .zatchDeepYellow
        $0.backgroundColor = .yellow40
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20/2
    }
    
    let secondWantCategory = UILabel().then{
        $0.text = "생활용품"
        $0.textColor = .black20
        $0.font = UIFont.pretendard(size: 10, family: .Medium)
    }
    let thirdWantCategory = UILabel().then{
        $0.text = "생활용품"
        $0.textColor = .black20
        $0.font = UIFont.pretendard(size: 10, family: .Medium)
    }
    
    let firstWantProduct = UILabel().then{
        $0.text = "맥도날드 해피밀 마이멜로디 장난감"
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textColor = .black85
    }
    
    let secondWantProduct = UILabel().then{
        $0.text = "신상 햄스터 말랑이"
        $0.numberOfLines = 2
        $0.textAlignment = .left
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textColor = .black85
    }
    let thirdWantProduct = UILabel().then{
        $0.text = "신상 햄스터 고양이 강아지 모양 말랑이"
        $0.numberOfLines = 2
        $0.textAlignment = .left
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textColor = .black85
    }
    
    let secondWantFrame = UIView()
    let thirdWantFrame = UIView()
    
    let secondThirdStackView = UIStackView().then{
        $0.spacing = 13
        $0.axis = .vertical
    }

    //my
    let myFrame = UIView()
    
    let myCategory = PaddingLabel().then{
        $0.text = "생활용품"
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textColor = .zatchPurple
        $0.backgroundColor = .purple40
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20/2
    }

    let myProductLabel = UILabel().then{
        $0.text = "헤드셋"
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textColor = .black85
    }
    
    let myZatchInfoFrame = UIView()
    
    let endDateFrame = UIStackView().then{
        $0.spacing = 10
        $0.axis = .horizontal
    }
    let buyDateFrame = UIStackView().then{
        $0.spacing = 10
        $0.axis = .horizontal
    }
    let countFrame = UIStackView().then{
        $0.spacing = 10
        $0.axis = .horizontal
    }
    let isOpenFrame = UIStackView().then{
        $0.spacing = 10
        $0.axis = .horizontal
    }
    
    let endDateTitle = UILabel().then{
        $0.text = "유통기한"
        $0.font = UIFont.pretendard(size: 12, family: .Bold)
        $0.textColor = .black85
    }
    let endDateLabel = UILabel().then{
        $0.text = "2021/01/28"
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textColor = .black85
    }
    
    let buyDateTitle = UILabel().then{
        $0.text = "구매 일자"
        $0.font = UIFont.pretendard(size: 12, family: .Bold)
        $0.textColor = .black85
    }
    let buyDateLabel = UILabel().then{
        $0.text = "2021/01/28"
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textColor = .black85
    }
    
    let countTitle = UILabel().then{
        $0.text = "수량"
        $0.font = UIFont.pretendard(size: 12, family: .Bold)
        $0.textColor = .black85
    }
    let countLabel = UILabel().then{
        $0.text = "2개"
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textColor = .black85
    }
    
    let isOpenTitle = UILabel().then{
        $0.text = "개봉 상태"
        $0.font = UIFont.pretendard(size: 12, family: .Bold)
        $0.textColor = .black85
    }
    let isOpenLabel = UILabel().then{
        $0.text = "개봉"
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textColor = .black85
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
        self.addSubview(wantFrame)
        self.addSubview(exchangeImage)
        self.addSubview(myFrame)
        
        
        self.wantFrame.addSubview(firstWantCategory)
        self.wantFrame.addSubview(firstWantProduct)
        self.wantFrame.addSubview(secondThirdStackView)
        
        self.secondThirdStackView.addArrangedSubview(secondWantFrame)
        self.secondThirdStackView.addArrangedSubview(thirdWantFrame)
        
        secondWantFrame.addSubview(secondWantTitle)
        secondWantFrame.addSubview(secondWantCategory)
        secondWantFrame.addSubview(secondWantProduct)
        
        thirdWantFrame.addSubview(thirdWantTitle)
        thirdWantFrame.addSubview(thirdWantCategory)
        thirdWantFrame.addSubview(thirdWantProduct)
        
        //--
        myFrame.addSubview(myCategory)
        myFrame.addSubview(myProductLabel)
        myFrame.addSubview(myZatchInfoFrame)
        
        myZatchInfoFrame.addSubview(endDateFrame)
        myZatchInfoFrame.addSubview(buyDateFrame)
        myZatchInfoFrame.addSubview(countFrame)
        myZatchInfoFrame.addSubview(isOpenFrame)
        
        endDateFrame.addArrangedSubview(endDateTitle)
        endDateFrame.addArrangedSubview(endDateLabel)
        
        buyDateFrame.addArrangedSubview(buyDateTitle)
        buyDateFrame.addArrangedSubview(buyDateLabel)
        
        countFrame.addArrangedSubview(countTitle)
        countFrame.addArrangedSubview(countLabel)
        
        isOpenFrame.addArrangedSubview(isOpenTitle)
        isOpenFrame.addArrangedSubview(isOpenLabel)
        
        //-----
        wantFrame.backgroundColor = .black20
        myFrame.backgroundColor = .black20
        
    }
    
    func setUpConstraint(){
        
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
        
        secondWantTitle.snp.makeConstraints{ make in
            make.height.equalTo(17)
            make.width.equalTo(39)
            make.leading.top.equalToSuperview()
        }
        
        secondWantCategory.snp.makeConstraints{ make in
            make.top.equalTo(secondWantTitle.snp.bottom)
            make.leading.equalToSuperview().offset(4)
            make.height.equalTo(13)
            make.width.equalTo(39)
            make.bottom.equalToSuperview().offset(-2)
        }
        
        secondWantProduct.snp.makeConstraints{ make in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(secondWantTitle.snp.trailing).offset(9)
        }
        
        thirdWantTitle.snp.makeConstraints{ make in
            make.height.equalTo(17)
            make.width.equalTo(39)
            make.leading.top.equalToSuperview()
        }
        
        thirdWantCategory.snp.makeConstraints{ make in
            make.top.equalTo(thirdWantTitle.snp.bottom)
            make.leading.equalToSuperview().offset(4)
            make.height.equalTo(13)
            make.width.equalTo(39)
            make.bottom.equalToSuperview().offset(-2)
        }
        
        thirdWantProduct.snp.makeConstraints{ make in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(thirdWantTitle.snp.trailing).offset(9)
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
        
        
        myZatchInfoFrame.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(myProductLabel.snp.bottom).offset(7)
        }
        
        endDateFrame.snp.makeConstraints{ make in
            make.top.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        buyDateFrame.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.top.equalTo(endDateFrame.snp.bottom).offset(6)
            make.trailing.equalToSuperview()
        }
        
        countFrame.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.top.equalTo(buyDateFrame.snp.bottom).offset(8)
            make.trailing.equalToSuperview()
        }
        
        isOpenFrame.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.top.equalTo(countFrame.snp.bottom).offset(4)
            make.trailing.equalToSuperview()
        }
        
        endDateTitle.snp.makeConstraints{ make in
            make.width.equalTo(47)
            make.height.equalTo(17)
        }
        
        buyDateTitle.snp.makeConstraints{ make in
            make.width.equalTo(47)
            make.height.equalTo(17)
        }
        
        countTitle.snp.makeConstraints{ make in
            make.width.equalTo(47)
            make.height.equalTo(17)
        }
        
        isOpenTitle.snp.makeConstraints{ make in
            make.width.equalTo(47)
            make.height.equalTo(17)
        }
        
    }
}
