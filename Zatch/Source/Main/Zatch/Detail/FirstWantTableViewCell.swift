//
//  ProductInfoTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/26.
//

import UIKit
import Then

class FirstWantTableViewCell: UITableViewCell {
    
    let myZatchCategory = UILabel()
    let wantZatchCategory = UILabel()
    let myZatchLabel = UILabel()
    let wantZatchLabel = UILabel()
    
    let exchangeImage = UIImageView()
    
    let borderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    let firstView = UIView()
    let firstLeftView = UIView()
    let firstRightView = UIView()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstriant()
        setUpValue()

        wantZatchLabel.numberOfLines = 0
        wantZatchLabel.textAlignment = .center
        
        myZatchLabel.numberOfLines = 0
        myZatchLabel.textAlignment = .center

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        self.contentView.addSubview(firstView)
        
        self.firstView.addSubview(firstLeftView)
        self.firstView.addSubview(firstRightView)
        self.firstView.addSubview(exchangeImage)
        self.firstView.addSubview(borderLine)
        
        self.firstLeftView.addSubview(wantZatchCategory)
        self.firstLeftView.addSubview(wantZatchLabel)
        
        self.firstRightView.addSubview(myZatchCategory)
        self.firstRightView.addSubview(myZatchLabel)
        
    }
    
    func setUpConstriant(){
        
        firstView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-16)
            make.height.equalTo(84)
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
        
        borderLine.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1)
        }
        
    }
    
    func setUpValue(){
        
        //임시 text
        wantZatchCategory.text = "생활용품"
        myZatchCategory.text = "생활용품"
        wantZatchLabel.text = "2022년 호랑이의 해 기념 호랑이 몰랑이 세트"
        myZatchLabel.text = "몰랑이 피규어"
        
        wantZatchCategory.textColor = .zatchDeepYellow
        wantZatchCategory.backgroundColor = .zatchYellow40
        wantZatchCategory.font = UIFont.pretendard(size: 12, family: .Medium)
        
        myZatchCategory.textColor = .zatchPurple
        myZatchCategory.backgroundColor = .zatchPurple40
        wantZatchCategory.font = UIFont.pretendard(size: 12, family: .Medium)
        myZatchCategory.font = UIFont.pretendard(size: 12, family: .Medium)
        
        wantZatchLabel.font = UIFont.pretendard(size: 16, family: .Bold)
        myZatchLabel.font = UIFont.pretendard(size: 16, family: .Bold)
        
        exchangeImage.image = UIImage(named: "exchange")
    }

}
