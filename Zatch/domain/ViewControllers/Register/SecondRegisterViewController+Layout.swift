//
//  SecondRegisterViewController+Layout.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/10.
//

import Foundation

extension SecondRegisterViewController{
    
    func setInitView(){
        
        tableView = UITableView().then{
            $0.delegate = self
            $0.dataSource = self
            
            $0.showsVerticalScrollIndicator = false
            $0.separatorStyle = .none
            
            $0.register(CategorySelectWithRankTableViewCell.self, forCellReuseIdentifier: CategorySelectWithRankTableViewCell.cellIdentifier)
            $0.register(ProductNameTabeViewCell.self, forCellReuseIdentifier: ProductNameTabeViewCell.cellIdentifier)
        }
        
    }
    
    func setUpView(){
        
        self.view.addSubview(exitBtn)
        self.view.addSubview(topTitleView)
        self.view.addSubview(tableView)
        self.view.addSubview(checkBoxFrame)
        self.view.addSubview(btnFrame)
        
        self.checkBoxFrame.addArrangedSubview(topCheckBoxFrame)
        self.checkBoxFrame.addArrangedSubview(belowCheckBoxFrame)
        
        topCheckBoxFrame.addArrangedSubview(topCheckBoxBtn)
        topCheckBoxFrame.addArrangedSubview(topCheckBoxLabel)
        
        belowCheckBoxFrame.addArrangedSubview(belowCheckBoxBtn)
        belowCheckBoxFrame.addArrangedSubview(belowCheckBoxLabel)
        
        btnFrame.addArrangedSubview(shareBtn)
        btnFrame.addArrangedSubview(nextBtn)
        
    }
    
    func setUpConstraint(){
        
        exitBtn.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalTo(super.backBtn)
        }
        
        topTitleView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(88)
            make.leading.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints{ make in
            make.top.equalTo(topTitleView.snp.bottom).offset(-11)
            make.leading.trailing.equalToSuperview()
        }
        
        checkBoxFrame.snp.makeConstraints{ make in
            make.top.equalTo(tableView.snp.bottom).offset(36)
            make.leading.equalToSuperview().offset(24)
        }
        
        topCheckBoxBtn.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
        }
        
        belowCheckBoxBtn.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
        }
        
        btnFrame.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-48)
            make.top.equalTo(checkBoxFrame.snp.bottom).offset(68) //68
        }
        
        nextBtn.snp.makeConstraints{ make in
            make.width.equalTo(shareBtn)
        }
        
        
    }
}
