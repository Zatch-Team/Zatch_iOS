//
//  RightChattingImageTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/30.
//

import UIKit

class RightChattingImageTableViewCell: BaseTableViewCell {
    
    //MARK: - UI
    
    let imageMessageView = UIImageView().then{
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    let timeLabel = UILabel().then{
        $0.setTypoStyleWithSingleLine(typoStyle: .regular13)
        $0.textColor = .black85
        $0.text = "13:42"
    }
    //MARK: - Helper
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(timeLabel)
        baseView.addSubview(imageMessageView)
    }
    override func layout() {
        
        super.layout()

        contentView.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        baseView.snp.updateConstraints{
            $0.top.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().offset(-8)
        }
        
        timeLabel.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.trailing.equalTo(imageMessageView.snp.leading).offset(-4)
        }
        
        imageMessageView.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview()
            $0.width.height.lessThanOrEqualTo(200 / 360 * Const.Device.DEVICE_WIDTH)
        }
    }
}
