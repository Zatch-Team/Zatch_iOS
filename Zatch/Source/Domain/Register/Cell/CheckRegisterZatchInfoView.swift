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
    
    let firstWantCategory = UILabel().then{
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
    
    let myCategory = UILabel().then{
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
    
}
