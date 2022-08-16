//
//  ChattingListTableViewCell+Layout.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/16.
//

import UIKit

extension ChattingListTableViewCell {
    
    func setUpView(){
        
        self.contentView.addSubview(backView)
        
        self.infoStackView.addArrangedSubview(nameLabel)
        self.infoStackView.addArrangedSubview(recentMessageLabel)
        
        self.backView.addSubview(profileImage)
        self.backView.addSubview(infoStackView)
        self.backView.addSubview(timeLabel)
        self.backView.addSubview(borderLine)
    }
    
    func setUpConstraint(){
        
        backView.snp.makeConstraints{ make in
            make.leading.trailing.top.bottom.equalToSuperview()
            make.height.equalTo(80)
        }
        
        profileImage.snp.makeConstraints{ make in
            make.width.height.equalTo(68)
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        infoStackView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(18)
            make.bottom.equalToSuperview().offset(-22)
            make.leading.equalTo(profileImage.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-80)
        }

        timeLabel.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalToSuperview().offset(16)
            make.height.equalTo(20)
        }
        
        borderLine.snp.makeConstraints{ make in
            make.height.equalTo(1)
            make.bottom.equalToSuperview().offset(-1)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        
    }

}
