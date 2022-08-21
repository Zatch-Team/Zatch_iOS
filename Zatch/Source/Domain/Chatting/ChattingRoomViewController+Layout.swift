//
//  File.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/17.
//

import Foundation

extension ChattingRoomViewController{
    
    func setInitView(){
        tableView = UITableView().then{
            $0.separatorStyle = .none
            
            $0.delegate = self
            $0.dataSource = self

        }
    }
    
    func setUpView(){
        
        super.navigationView.addSubview(nameLabel)
        super.navigationView.addSubview(townLabel)
        super.navigationView.addSubview(reservationFinishTag)
        super.navigationView.addSubview(etcBtn)
        super.navigationTitle.removeFromSuperview()
        
        self.view.addSubview(tableView)
        self.view.addSubview(chatBottomFrame)
        
        chatBottomFrame.addArrangedSubview(chatInputView)
//        self.view.addSubview(chatInputView)
//        self.view.addSubview(chatEtcBtnView)
        
    }
    
    func setUpConstraint(){
        
        nameLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(60)
            make.centerY.equalToSuperview()
            make.height.equalTo(24)
        }
        
        townLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(22)
            make.bottom.equalToSuperview().offset(-18)
            make.leading.equalTo(nameLabel.snp.trailing).offset(8)
        }
        
        reservationFinishTag.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(etcBtn.snp.leading).offset(-16)
            make.height.equalTo(24)
            make.width.equalTo(58)
        }
        
        etcBtn.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
        
        tableView.snp.makeConstraints{ make in
            make.bottom.equalTo(chatInputView.snp.top)
            make.top.equalTo(super.navigationView.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        chatBottomFrame.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        chatInputView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
        }
        
    }
}
