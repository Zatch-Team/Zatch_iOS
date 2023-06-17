//
//  ChattingLeftTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/29.
//

import UIKit

class LeftChattingMessageTableViewCell: BaseTableViewCell {

    //MARK: - UI
    
    let profileImage = UIImageView().then{
        $0.image = Image.zatchProfile
    }
    
    let userNameLabel = UILabel().then{
        $0.text = "쑤야"
        $0.numberOfLines = 1
        $0.setTypoStyleWithSingleLine(typoStyle: .medium16)
        $0.textColor = .black85
    }
    let messageLabel = PaddingLabel(padding: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)).then{
        $0.text = "가나다라마ㅏ바라ㅏ아"
        $0.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner)
        $0.layer.cornerRadius = 16
        $0.clipsToBounds = true
        $0.textColor = .black85
        $0.backgroundColor = .black10
        $0.setTypoStyleWithMultiLine(typoStyle: .regular16)
        $0.numberOfLines = 0
    }
    let timeLabel = UILabel().then{
        $0.text = "13:42"
        $0.setTypoStyleWithSingleLine(typoStyle: .regular13)
        $0.textColor = .black85
    }
    
    //MARK: - Helper
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(profileImage)
        baseView.addSubview(userNameLabel)
        baseView.addSubview(timeLabel)
        baseView.addSubview(messageLabel)
    }
    
    override func layout() {
        
        super.layout()
        
        contentView.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(13)
        }
        
        baseView.snp.updateConstraints{
            $0.top.bottom.equalToSuperview().inset(8)
        }
        
        profileImage.snp.makeConstraints{ make in
            make.width.height.equalTo(48)
            make.top.leading.equalToSuperview()
        }
        
        userNameLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalTo(profileImage.snp.trailing).offset(8)
        }
        
        messageLabel.snp.makeConstraints{
            $0.top.equalTo(userNameLabel.snp.bottom).offset(7)
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(profileImage.snp.trailing).offset(8)
            $0.trailing.lessThanOrEqualToSuperview().inset(38)
        }
        
        timeLabel.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(messageLabel.snp.trailing).offset(4)
        }
    }
    
}
