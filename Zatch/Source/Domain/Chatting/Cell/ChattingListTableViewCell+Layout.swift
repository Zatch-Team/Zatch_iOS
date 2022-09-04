//
//  ChattingListTableViewCell+Layout.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/16.
//

import UIKit

extension ChattingListTableViewCell {
    
    func setUpView(){
        baseView.addSubview(profileImage)
        baseView.addSubview(infoStackView)
        baseView.addSubview(timeLabel)
        baseView.addSubview(borderLine)
        
        infoStackView.addArrangedSubview(nameLabel)
        infoStackView.addArrangedSubview(recentMessageLabel)
    }
    
    func setUpConstraint(){
        
        baseView.snp.makeConstraints{ make in
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
