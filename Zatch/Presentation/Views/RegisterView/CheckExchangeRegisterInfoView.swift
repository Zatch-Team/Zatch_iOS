//
//  CheckExchangeRegisterInfoView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/11.
//

import Foundation

class CheckExchangeRegisterInfoView: BaseView, MyProductInformationView{
    
    private let exchangeImage = UIImageView().then{
        $0.image = Image.exchange
    }
    private let wantFrame = UIView()
    
    let firstWantCategoryTag = ZatchComponent.Tag.filled(color: .yellow, configuration: .height20)
    let firstWantProductNameLabel = UILabel().then{
        $0.numberOfLines = 2
        $0.textColor = .black85
        $0.setTypoStyleWithMultiLine(typoStyle: .medium12)
        $0.textAlignment = .center
    }
    private let secondThirdStackView = UIStackView().then{
        $0.spacing = 13
        $0.axis = .vertical
    }
    let secondWantFrame = WantPriorityProductInfoView(priority: 2)
    let thirdWantFrame = WantPriorityProductInfoView(priority: 3)
    
    private let myFrame = UIView()
    let myProductCategoryTag = ZatchComponent.Tag.filled(color: .purple, configuration: .height20)
    let myProductNameLabel = UILabel().then{
        $0.numberOfLines = 2
        $0.textColor = .black85
        $0.setTypoStyleWithMultiLine(typoStyle: .medium12)
        $0.textAlignment = .center
    }
    let myProductDetailView = CheckRegisterView.MyProductDetailView()
    
    override func hierarchy(){
        addSubview(wantFrame)
        addSubview(exchangeImage)
        addSubview(myFrame)
        
        wantFrame.addSubview(firstWantCategoryTag)
        wantFrame.addSubview(firstWantProductNameLabel)
        wantFrame.addSubview(secondThirdStackView)
        
        secondThirdStackView.addArrangedSubview(secondWantFrame)
        secondThirdStackView.addArrangedSubview(thirdWantFrame)
        
        myFrame.addSubview(myProductCategoryTag)
        myFrame.addSubview(myProductNameLabel)
        myFrame.addSubview(myProductDetailView)
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
        myProductDetailView.snp.makeConstraints{
            $0.top.equalTo(myProductNameLabel.snp.bottom).offset(11)
            $0.leading.equalToSuperview()
        }
    }
}



extension CheckExchangeRegisterInfoView{
    
    class WantPriorityProductInfoView: BaseView{
        
        init(priority: Int){
            priorityLabel.text = "\(priority)순위"
            super.init(frame: .zero)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
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
            $0.textAlignment = .left
        }
        
        override func hierarchy() {
            addSubview(priorityLabel)
            addSubview(productLabel)
            addSubview(categoryLabel)
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
        
        func setInformation(_ information: RegisterZatchRequestModel.WantProductPriority?){
            guard let information = information else {
                [priorityLabel, productLabel, categoryLabel].forEach{ $0.textColor = .white }; return
            }
            categoryLabel.text = ServiceType.Zatch.getCategoryFromCategories(at: information.p_category).title
            productLabel.text = information.p_name
        }
    }

}
