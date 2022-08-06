//
//  File.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/05.
//

import Foundation

extension MySearchViewController{
    
    func setUpView(){
        
        self.view.addSubview(navigationView)
        
        self.view.addSubview(topView)
        
        self.view.addSubview(selectFrame)
        self.selectFrame.addSubview(selectTextField)
        self.selectFrame.addSubview(underLine)
        self.selectFrame.addSubview(searchImage)
        
        self.view.addSubview(subTitle)
        self.view.addSubview(flexContainer)
        self.view.addSubview(nextButton)
        self.view.addSubview(skipButton)
        
        self.view.addSubview(collectionView)
    }
    
    func setUpConstraints(){
        
        self.navigationView.snp.makeConstraints{ make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        self.topView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(88)
            make.leading.trailing.equalToSuperview()
        }
        
        //selectFrame
        self.selectFrame.snp.makeConstraints{ make in
            make.height.equalTo(122)
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        self.selectTextField.snp.makeConstraints{ make in
            make.height.equalTo(44)
            make.top.equalTo(topView.snp.bottom).offset(54)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
        }
        
        self.underLine.snp.makeConstraints{ make in
            make.top.equalTo(selectTextField.snp.bottom).offset(8)
            make.height.equalTo(1.5)
            make.leading.equalTo(selectTextField)
            make.trailing.equalTo(selectTextField)
        }
        
        
        //
        self.subTitle.snp.makeConstraints{ make in
            make.top.equalTo(underLine.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(20)
        }
        
        self.collectionView.snp.makeConstraints{ make in
            make.top.equalTo(subTitle.snp.bottom).offset(16)
            make.bottom.equalTo(nextButton.snp.top).offset(-16)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        self.nextButton.snp.makeConstraints{ make in
            make.bottom.equalTo(skipButton.snp.top).offset(-12)
            make.leading.equalToSuperview().offset(74)
            make.trailing.equalToSuperview().offset(-74)
        }
        
        self.skipButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-26)
        }
    }
}
