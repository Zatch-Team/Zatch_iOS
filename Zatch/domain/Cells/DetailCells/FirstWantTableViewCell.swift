//
//  ProductInfoTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/26.
//

import UIKit
import Then

class FirstWantTableViewCell: BaseTableViewCell {
    
    let myZatchCategory = UILabel().then{
        $0.text = "생활용품"
        $0.textColor = .zatchPurple
        $0.backgroundColor = .purple40
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
    }
    
    let wantZatchCategory = UILabel().then{
        $0.text = "생활용품"
        $0.textColor = .zatchDeepYellow
        $0.backgroundColor = .yellow40
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
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
        $0.image = UIImage(named: "exchange")
    }
    
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        baseView.addSubview(firstView)
        
        firstView.addSubview(firstLeftView)
        firstView.addSubview(firstRightView)
        firstView.addSubview(exchangeImage)
        firstView.addSubview(borderLine)
        
        firstLeftView.addSubview(wantZatchCategory)
        firstLeftView.addSubview(wantZatchLabel)
        
        firstRightView.addSubview(myZatchCategory)
        firstRightView.addSubview(myZatchLabel)
        
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

}
