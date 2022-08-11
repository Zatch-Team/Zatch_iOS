//
//  CheckRegisterZatchInfoView+Layout.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/11.
//

import Foundation

extension CheckRegisterZatchInfoView{
    
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
            make.centerX.equalToSuperview()
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
