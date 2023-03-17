//
//  ProductInfoTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/26.
//

import UIKit
import Then

class ExchangeDetailTableViewCell: BaseTableViewCell {
    
    let myZatchCategory = PaddingLabel(padding: ZatchComponent.Padding(left: 8, right: 8, top: 2, bottom: 2)).then{
        $0.text = "생활용품"
        $0.textColor = .zatchPurple
        $0.backgroundColor = .purple40
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.layer.cornerRadius = 20/2
        $0.clipsToBounds = true
    }
    
    let wantZatchCategory = PaddingLabel(padding: ZatchComponent.Padding(left: 8, right: 8, top: 2, bottom: 2)).then{
        $0.text = "생활용품"
        $0.textColor = .zatchDeepYellow
        $0.backgroundColor = .yellow40
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.layer.cornerRadius = 20/2
        $0.clipsToBounds = true
    }
    
    let myZatchLabel = UILabel().then{
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.text = "몰랑이 피규어"
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }
    
    let wantZatchLabel = UILabel().then{
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.text = "2022년 호랑이의 해 기념 호랑이 몰랑이 세트"
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }
    
    let exchangeImage = UIImageView().then{
        $0.image = Image.exchange
    }
    
    let firstBorderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    let firstView = UIView()
    let firstLeftView = UIView()
    let firstRightView = UIView()
    
    let wantElseStackView = UIStackView().then{
        $0.spacing = 12
        $0.axis = .horizontal
        $0.distribution = .fillProportionally
    }
    
    let secondWantView = WantElseExchangeView().then{
        $0.rankLabel.text = "2순위"
    }
    
    let thirdWantView = WantElseExchangeView().then{
        $0.rankLabel.text = "3순위"
    }
    
    let elseBorderLine = UIView().then{
        $0.backgroundColor = .black5
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstriant()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        baseView.addSubview(firstView)
        baseView.addSubview(firstBorderLine)
        baseView.addSubview(wantElseStackView)
        baseView.addSubview(elseBorderLine)
        
        firstView.addSubview(firstLeftView)
        firstView.addSubview(firstRightView)
        firstView.addSubview(exchangeImage)
        
        firstLeftView.addSubview(wantZatchCategory)
        firstLeftView.addSubview(wantZatchLabel)
        
        firstRightView.addSubview(myZatchCategory)
        firstRightView.addSubview(myZatchLabel)
        
        wantElseStackView.addArrangedSubview(secondWantView)
        wantElseStackView.addArrangedSubview(thirdWantView)
        
    }
    
    func setUpConstriant(){
        
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
        
        wantElseStackView.snp.makeConstraints{
            $0.top.equalTo(firstBorderLine.snp.bottom).offset(20)
            $0.height.equalTo(34)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        secondWantView.snp.makeConstraints{
            $0.top.leading.bottom.equalToSuperview()
        }
        
        thirdWantView.snp.makeConstraints{
            $0.top.trailing.bottom.equalToSuperview()
            $0.width.equalTo(secondWantView)
        }
        
        elseBorderLine.snp.makeConstraints{
            $0.top.equalTo(wantElseStackView.snp.bottom).offset(20)
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }

}

extension ExchangeDetailTableViewCell{
    
    class WantElseExchangeView: UIView{
        
        let rankLabel = UILabel().then{
            $0.textColor = .zatchDeepYellow
            $0.font = UIFont.pretendard(size: 15, family: .Bold)
        }
        
        let categoryLabel = UILabel().then{
            $0.text = "생활용품"
            $0.numberOfLines = 1
            $0.textColor = .black45
            $0.font = UIFont.pretendard(size: 12, family: .Medium)
        }
        
        let productLabel = UILabel().then{
            $0.text = "몰랑이 햄스터 몰랑이 햄스터 몰랑이 햄스터 몰랑이 햄스터 "
            $0.numberOfLines = 2
            $0.textColor = .black85
            $0.font = UIFont.pretendard(size: 14, family: .Bold)
        }
        
        let stackView = UIStackView().then{
            $0.axis = .vertical
            $0.spacing = 0
            $0.alignment = .center
        }
        
        override init(frame: CGRect){
            super.init(frame: .zero)
            
            setUpView()
            setUpConstraint()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setUpView(){
            
            self.addSubview(stackView)
            self.addSubview(productLabel)
            
            stackView.addArrangedSubview(rankLabel)
            stackView.addArrangedSubview(categoryLabel)
        }
        
        func setUpConstraint(){
        
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
    }
}
