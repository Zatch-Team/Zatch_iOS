//
//  CheckRegisterZatchInfoView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/11.
//

import UIKit

class CheckRegisterInfoView: UIView {
    
    let wantCategory = PaddingLabel().then{
        $0.text = "생활용품"
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textColor = .zatchDeepYellow
        $0.backgroundColor = .yellow40
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20/2
    }
    
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
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.numberOfLines = 2
    }
    
    let myZatchInfoFrame = UIView()
    
    let endDateFrame = MyProductStackView().then{
        $0.titleLabel.text = "유통기한"
        $0.infoLabel.text = "2021/01/28"
    }
    
    let buyDateFrame = MyProductStackView().then{
        $0.titleLabel.text = "구매일자"
        $0.infoLabel.text = "2021/01/28"
    }
    
    let countFrame = MyProductStackView().then{
        $0.titleLabel.text = "수량"
        $0.infoLabel.text = "2개"
    }
    
    let isOpenFrame = MyProductStackView().then{
        $0.titleLabel.text = "개봉상태"
        $0.infoLabel.text = "개봉"
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

        self.addSubview(myCategory)
        self.addSubview(myProductLabel)
        self.addSubview(myZatchInfoFrame)
        
        myZatchInfoFrame.addSubview(endDateFrame)
        myZatchInfoFrame.addSubview(buyDateFrame)
        myZatchInfoFrame.addSubview(countFrame)
        myZatchInfoFrame.addSubview(isOpenFrame)
        
    }
    
    func setUpConstraint(){
        
        myCategory.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(16)
            make.height.equalTo(20)
        }
        
        wantCategory.snp.makeConstraints{
            $0.top.equalToSuperview().offset(16)
            $0.height.equalTo(20)
        }
        
        myProductLabel.snp.makeConstraints{ make in
            make.top.equalTo(myCategory.snp.bottom).offset(5)
            make.height.equalTo(32)
        }
        
        
        myZatchInfoFrame.snp.makeConstraints{ make in
            make.top.equalTo(myProductLabel.snp.bottom).offset(7)
            make.bottom.equalToSuperview()
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
        
    }
}

extension CheckRegisterInfoView{
    
    class MyProductStackView: UIStackView{
        
        let titleLabel = UILabel().then{
            $0.font = UIFont.pretendard(size: 12, family: .Bold)
            $0.textColor = .black85
        }
        
        let infoLabel = UILabel().then{
            $0.font = UIFont.pretendard(size: 12, family: .Medium)
            $0.textColor = .black85
        }
        
        override init(frame: CGRect){
            
            super.init(frame: .zero)
            
            self.spacing = 10
            self.axis = .horizontal
            
            self.addArrangedSubview(titleLabel)
            self.addArrangedSubview(infoLabel)
            
            titleLabel.snp.makeConstraints{
                $0.width.equalTo(47)
            }
        }
        
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
}
