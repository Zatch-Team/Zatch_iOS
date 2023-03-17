//
//  ChattingRightTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/29.
//

import UIKit

class RightChattingMessageTableViewCell: BaseTableViewCell {
    
    //MARK: - UI
    
    let messageLabel = PaddingLabel(padding: ZatchComponent.Padding(left: 8, right: 16, top: 8, bottom: 16)).then{
        $0.text = "가나다라마ㅏ바라ㅏ아사ㅏ가나다라마ㅏ바라ㅏ아사ㅏ가나다라마ㅏ바라ㅏ아사ㅏ가나다라마ㅏ바라ㅏ아"
        $0.layer.cornerRadius = 16
        $0.clipsToBounds = true
        $0.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMinYCorner)
        $0.setTypoStyleWithMultiLine(typoStyle: .regular16)
        $0.backgroundColor = .zatchPurple
        $0.textColor = .white
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
        baseView.addSubview(timeLabel)
        baseView.addSubview(messageLabel)
    }
    
    override func layout() {
        
        super.layout()
        
        contentView.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        baseView.snp.updateConstraints{
            $0.top.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().offset(-8)
        }
        
        timeLabel.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.trailing.equalTo(messageLabel.snp.leading).offset(-4)
        }
        
        messageLabel.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview()
            $0.leading.greaterThanOrEqualToSuperview().inset(38)
        }
    }
}
