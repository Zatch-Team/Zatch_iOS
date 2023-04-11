//
//  LeftChattingImageTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/30.
//

import UIKit

class LeftChattingImageTableViewCell: BaseTableViewCell {
    
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
    
    let imageMessageView = UIImageView().then{
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
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
        baseView.addSubview(imageMessageView)
    }
    
    override func layout() {
        super.layout()
        
        contentView.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        baseView.snp.updateConstraints{
            $0.top.bottom.equalToSuperview().inset(8)
        }
        
        profileImage.snp.makeConstraints{
            $0.width.height.equalTo(48)
            $0.top.leading.equalToSuperview()
        }
        
        userNameLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalTo(profileImage.snp.trailing).offset(8)
        }
        
        imageMessageView.snp.makeConstraints{
            $0.top.equalTo(userNameLabel.snp.bottom).offset(7)
            $0.leading.equalTo(profileImage.snp.trailing).offset(8)
            $0.bottom.equalToSuperview()
            $0.width.height.lessThanOrEqualTo(200 / 360 * Device.width)
        }
        
        timeLabel.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(imageMessageView.snp.trailing).offset(4)
        }
    }
}
