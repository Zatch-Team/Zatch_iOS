//
//  ProductInfoTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/26.
//

import UIKit
import Then

protocol BindingZatch where Self: BaseTableViewCell{
    func bindingData(_ zatch: ZatchResponseModel)
}

final class ExchangeDetailTableViewCell: BaseTableViewCell, BindingZatch {
    
    private let myZatchCategory = ZatchComponent.Tag.filled(color: .purple, configuration: .height20)
    
    private let wantZatchCategory = ZatchComponent.Tag.filled(color: .yellow, configuration: .height20)
    
    private let myZatchLabel = UILabel().then{
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }
    
    private let wantZatchLabel = UILabel().then{
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }
    
    private let exchangeImage = UIImageView().then{
        $0.image = Image.exchange
    }
    
    private let firstBorderLine = ZatchComponent.BorderLine(color: .black5, height: 1)
    
    private let firstView = UIView()
    private let firstLeftView = UIView()
    private let firstRightView = UIView()
    
    private let wantElseStackView = UIStackView().then{
        $0.spacing = 12
        $0.axis = .horizontal
        $0.distribution = .fillProportionally
    }
    
    private let secondWantView = WantElseExchangeView(priority: 2)
    private let thirdWantView = WantElseExchangeView(priority: 3)
    private let elseBorderLine = ZatchComponent.BorderLine(color: .black5, height: 1)
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(firstView)
        baseView.addSubview(firstBorderLine)
        baseView.addSubview(wantElseStackView)

        firstView.addSubview(firstLeftView)
        firstView.addSubview(firstRightView)
        firstView.addSubview(exchangeImage)
        
        firstLeftView.addSubview(wantZatchCategory)
        firstLeftView.addSubview(wantZatchLabel)
        
        firstRightView.addSubview(myZatchCategory)
        firstRightView.addSubview(myZatchLabel)
        
        wantElseStackView.addArrangedSubview(secondWantView)
        wantElseStackView.addArrangedSubview(thirdWantView)
        wantElseStackView.addSubview(elseBorderLine)
    }
    
    override func layout() {
        
        super.layout()
        
        firstView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(64)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        exchangeImage.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.width.height.equalTo(24)
            make.top.equalTo(wantZatchCategory.snp.top).offset(7)
        }
        
        //firstLeftView
        firstLeftView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(136)
            make.trailing.equalTo(exchangeImage.snp.leading).offset(-12)
        }
        
        wantZatchCategory.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        wantZatchLabel.snp.makeConstraints{ make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(wantZatchCategory.snp.bottom).offset(4)
        }
        
        //firstRightView
        firstRightView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(136)
            make.leading.equalTo(exchangeImage.snp.trailing).offset(12)
        }
        
        myZatchCategory.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        myZatchLabel.snp.makeConstraints{ make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(myZatchCategory.snp.bottom).offset(4)
        }
        
        firstBorderLine.snp.makeConstraints{ make in
            make.top.equalTo(firstView.snp.bottom).offset(16)
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    private func setLowerRankLayout(isBlank: Bool){
        if isBlank {
            setFirstBorderLineWithEmptyLowerRankView()
        } else {
            addLowerRankView()
            setLowerRankViewLayout()
        }
    }
    
    private func setFirstBorderLineWithEmptyLowerRankView(){
        firstBorderLine.snp.makeConstraints{
            $0.bottom.equalToSuperview()
        }
    }
    
    private func addLowerRankView(){
        baseView.addSubview(wantElseStackView)
        wantElseStackView.addArrangedSubview(secondWantView)
        wantElseStackView.addArrangedSubview(thirdWantView)
        wantElseStackView.addSubview(elseBorderLine)
    }
    
    private func setLowerRankViewLayout(){
        wantElseStackView.snp.makeConstraints{
            $0.top.equalTo(firstBorderLine.snp.bottom).offset(20)
            $0.height.equalTo(34)
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
        }
        
        secondWantView.snp.makeConstraints{
            $0.top.leading.bottom.equalToSuperview()
        }
        
        thirdWantView.snp.makeConstraints{
            $0.top.trailing.bottom.equalToSuperview()
            $0.width.equalTo(secondWantView)
        }
        
        elseBorderLine.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(20)
            $0.leading.trailing.equalTo(baseView)
            $0.height.equalTo(1)
        }
    }
    
    func bindingData(_ zatch: ZatchResponseModel){
        myZatchCategory.setCategoryTitle(categoryId: zatch.categoryId)
        wantZatchCategory.setCategoryTitle(categoryId: zatch.p_first_category)
        myZatchLabel.text = zatch.itemName
        wantZatchLabel.text = zatch.p_first_name
        secondWantView.bindingData(categoryId: zatch.p_second_category, productName: zatch.p_second_name)
        thirdWantView.bindingData(categoryId: zatch.p_third_category, productName: zatch.p_third_name)
        
        setLowerRankLayout(isBlank: zatch.isSecondAndThirdPriorityEmpty)
    }

}

extension ExchangeDetailTableViewCell{
    
    class WantElseExchangeView: BaseView{
        
        init(priority: Int){
            rankLabel.text = "\(priority)순위"
            super.init(frame: .zero)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private let rankLabel = UILabel().then{
            $0.textColor = .zatchDeepYellow
            $0.font = UIFont.pretendard(size: 15, family: .Bold)
        }
        
        private let categoryLabel = UILabel().then{
            $0.numberOfLines = 1
            $0.textColor = .black45
            $0.font = UIFont.pretendard(size: 12, family: .Medium)
        }
        
        private let productLabel = UILabel().then{
            $0.numberOfLines = 2
            $0.textColor = .black85
            $0.font = UIFont.pretendard(size: 14, family: .Bold)
        }
        
        private let stackView = UIStackView().then{
            $0.axis = .vertical
            $0.spacing = 0
            $0.alignment = .center
        }
        
        override func hierarchy() {
            addSubview(stackView)
            addSubview(productLabel)
            
            stackView.addArrangedSubview(rankLabel)
            stackView.addArrangedSubview(categoryLabel)
        }
        
        override func layout() {
            stackView.snp.makeConstraints{ make in
                make.top.leading.bottom.equalToSuperview()
                
                let label = UILabel().then{
                    $0.text = "생활용품"
                    $0.font = UIFont.pretendard(size: 12, family: .Medium)
                }
                make.width.equalTo(label.intrinsicContentSize.width)
            }
            
            productLabel.snp.makeConstraints{ make in
                make.centerY.equalToSuperview()
                make.leading.equalTo(stackView.snp.trailing).offset(12) //12
                make.trailing.equalToSuperview()
            }
        }
        
        func bindingData(categoryId: Int?, productName: String){
            guard let categoryId = categoryId else {
                rankLabel.text = ""; return
            }
            categoryLabel.text = ServiceType.Zatch.getCategoryFromCategories(at: categoryId).title
            productLabel.text = productName
        }
    }
}
