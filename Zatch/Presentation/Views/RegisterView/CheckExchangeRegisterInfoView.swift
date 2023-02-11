//
//  CheckExchangeRegisterInfoView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/11.
//

import Foundation

class CheckExchangeRegisterInfoView: BaseView{
    
    let exchangeImage = UIImageView().then{
        $0.image = Image.exchange
    }

    let wantFrame = UIView()
    let firstWantCategoryTag = ZatchComponent.YellowTag(configuration: .height20).then{
        $0.setTitle("생활용품")
    }
    let firstWantProductNameLabel = UILabel().then{
        $0.text = "맥도날드 해피밀 마이멜로디 장난감"
        $0.numberOfLines = 2
        $0.textColor = .black85
        $0.setTypoStyleWithMultiLine(typoStyle: .medium12)
        $0.textAlignment = .center
    }
    let secondThirdStackView = UIStackView().then{
        $0.spacing = 13
        $0.axis = .vertical
    }
    let secondWantFrame = WantPriorityProductInfoView().then{
        $0.setPriorityTitle(priority: 2)
        $0.setCategoryTitle(categoryId: 1)
        $0.setProductName("신상 햄스터 말랑이")
    }
    let thirdWantFrame = WantPriorityProductInfoView().then{
        $0.setPriorityTitle(priority: 3)
        $0.setCategoryTitle(categoryId: 1)
        $0.setProductName("신상 햄스터 고양이 강아지 모양 말랑이")
    }
    
    let myFrame = UIView()
    let myProductCategoryTag = ZatchComponent.PurlpleTag(configuration: .height20).then{
        $0.setTitle("생활용품")
    }
    let myProductNameLabel = UILabel().then{
        $0.text = "장난감"
        $0.numberOfLines = 2
        $0.textColor = .black85
        $0.setTypoStyleWithMultiLine(typoStyle: .medium12)
        $0.textAlignment = .center
    }
    let myProductDetail = CheckRegisterView.MyProductDetailView()
    
    
    override func hierarchy(){
        
        self.addSubview(wantFrame)
        self.addSubview(exchangeImage)
        self.addSubview(myFrame)
        
        wantFrame.addSubview(firstWantCategoryTag)
        wantFrame.addSubview(firstWantProductNameLabel)
        wantFrame.addSubview(secondThirdStackView)
        
        secondThirdStackView.addArrangedSubview(secondWantFrame)
        secondThirdStackView.addArrangedSubview(thirdWantFrame)
        
        myFrame.addSubview(myProductCategoryTag)
        myFrame.addSubview(myProductNameLabel)
        myFrame.addSubview(myProductDetail)
        
    }
    
    override func layout(){

        exchangeImage.snp.makeConstraints{
            $0.top.equalToSuperview().offset(7)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        
        wantFrame.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(23)
            $0.trailing.equalTo(exchangeImage.snp.leading)
        }
        firstWantCategoryTag.snp.makeConstraints{
            $0.centerX.equalToSuperview()
        }
        firstWantProductNameLabel.snp.makeConstraints{
            $0.top.equalTo(firstWantCategoryTag.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(32)
        }
        secondThirdStackView.snp.makeConstraints{
            $0.top.equalTo(firstWantProductNameLabel.snp.bottom).offset(11)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-4)
        }
        
        myFrame.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-24)
            $0.leading.equalTo(exchangeImage.snp.trailing).offset(20)
        }
        myProductCategoryTag.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.centerX.equalTo(myProductNameLabel)
        }
        myProductNameLabel.snp.makeConstraints{
            $0.top.equalTo(myProductCategoryTag.snp.bottom).offset(5)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-11)
            $0.height.equalTo(32)
        }
        myProductDetail.snp.makeConstraints{
            $0.top.equalTo(myProductNameLabel.snp.bottom).offset(11)
            $0.leading.equalToSuperview()
        }
    }
}



extension CheckExchangeRegisterInfoView{
    
    class WantPriorityProductInfoView: BaseView{
        
        private let priorityLabel = UILabel().then{
            $0.setTypoStyleWithSingleLine(typoStyle: .bold12)
            $0.textColor = .zatchDeepYellow
            $0.textAlignment = .center
        }
        
        private let productLabel = UILabel().then{
            $0.numberOfLines = 2
            $0.setTypoStyleWithMultiLine(typoStyle: .medium12)
            $0.textColor = .black85
            $0.textAlignment = .left
        }
        
        private let categoryLabel = UILabel().then{
            $0.textColor = .black20
            $0.setTypoStyleWithSingleLine(typoStyle: .medium10)
        }
        
        override func hierarchy() {
            self.addSubview(priorityLabel)
            self.addSubview(productLabel)
            self.addSubview(categoryLabel)
        }
        
        override func layout() {
            priorityLabel.snp.makeConstraints{
                $0.height.equalTo(17)
                $0.width.equalTo(39)
                $0.leading.top.equalToSuperview()
            }
            categoryLabel.snp.makeConstraints{
                $0.top.equalTo(priorityLabel.snp.bottom)
                $0.leading.equalToSuperview().offset(4)
                $0.height.equalTo(13)
                $0.width.equalTo(39)
                $0.bottom.equalToSuperview().offset(-2)
            }
            productLabel.snp.makeConstraints{
                $0.top.trailing.equalToSuperview()
                $0.leading.equalTo(priorityLabel.snp.trailing).offset(9)
            }
        }
        
        func setPriorityTitle(priority: Int){
            priorityLabel.text = "\(priority)순위"
        }
        
        func setCategoryTitle(categoryId: Int){
            let category = ServiceType.Zatch.getCategoryFromCategories(at: categoryId).title
            categoryLabel.text = category
        }
        
        func setProductName(_ name: String){
            productLabel.text = name
        }
    }

}
