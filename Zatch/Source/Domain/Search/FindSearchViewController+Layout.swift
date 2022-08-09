//
//  File.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/06.
//

import Foundation

extension FindSearchViewController{
    
    //뷰 구성요소 세팅
    func setUpView(){
        
        view.addSubview(titleView)
        
        view.addSubview(exchangeFrame)
        exchangeFrame.addSubview(myLabel)
        exchangeFrame.addSubview(exchangeImage)
        exchangeFrame.addSubview(wantTextField)
        exchangeFrame.addSubview(textFieldBorderLine)
        exchangeFrame.addSubview(searchImage)
        
        view.addSubview(subTitle1)
        view.addSubview(firstCollectionView)
        
        view.addSubview(subTitle2)
        view.addSubview(secondCollectionView)
        view.addSubview(nextButton)
    }
    
    //뷰 제약조건 설정
    func setConstraints(){
        
        titleView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(88)
            make.leading.trailing.equalToSuperview()
        }
        
        exchangeFrame.snp.makeConstraints{ make in
            make.top.equalTo(titleView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(170)
        }
        
        myLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(18)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(20)
        }
        
        exchangeImage.snp.makeConstraints{ make in
            make.top.equalTo(myLabel.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        wantTextField.snp.makeConstraints{ make in
            make.top.equalTo(exchangeImage.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(20)
        }
        
        searchImage.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
            make.bottom.equalTo(textFieldBorderLine.snp.top).offset(-8)
            make.trailing.equalToSuperview().offset(-48)
            make.top.equalTo(wantTextField)
        }
        
        textFieldBorderLine.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.height.equalTo(2)
        }
        
        subTitle1.snp.makeConstraints{ make in
            make.top.equalTo(exchangeFrame.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(24)
        }
        
        firstCollectionView.snp.makeConstraints{ make in
            make.top.equalTo(subTitle1.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview()
            make.height.equalTo(28)
        }
        
        subTitle2.snp.makeConstraints{ make in
            make.top.equalTo(firstCollectionView.snp.bottom).offset(28)
            make.left.equalToSuperview().offset(24)
        }
        
        secondCollectionView.snp.makeConstraints{ make in
            make.top.equalTo(subTitle2.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview()
            make.height.equalTo(28)
        }
        
        nextButton.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().offset(-54)
            make.leading.equalToSuperview().offset(74)
            make.trailing.equalToSuperview().offset(-74)
            make.height.equalTo(36)
        }
    }
}
