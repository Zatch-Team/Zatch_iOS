//
//  ChattingLeftTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/29.
//

import UIKit

class LeftChattingMessageTableViewCell: BaseTableViewCell {
    
    //MARK: - Properties
    
    static let cellIdentifier = "leftMessageCell"
    
    //MARK: - UI
    
    let profileImage = UIImageView().then{
        $0.image = UIImage(named: "zatch_profile")
    }
    
    let userNameLabel = UILabel().then{
        $0.textColor = .black
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.numberOfLines = 1
        $0.text = "쑤야"
    }
    
    let messageLabel = PaddingLabel(padding: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)).then{
        $0.layer.cornerRadius = 14
        $0.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner)
        $0.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
        $0.clipsToBounds = true
        $0.textColor = UIColor(red: 38/255, green: 38/255, blue: 38/255, alpha: 1)
        $0.font = UIFont.pretendard(size: 14, family: .Regular)
        $0.numberOfLines = 0
        
        $0.text = "가나다라마ㅏ바라ㅏ아"
    }
    let timeLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 12, family: .Regular)
        $0.textColor = .black85
        
        $0.text = "13:42"
    }
    
    //MARK: - LifeCycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper
    
    private func setUpView(){
        baseView.addSubview(profileImage)
        baseView.addSubview(userNameLabel)
        baseView.addSubview(timeLabel)
        baseView.addSubview(messageLabel)
    }
    
    private func setUpConstraint(){
        
        self.contentView.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        baseView.snp.updateConstraints{ make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        self.profileImage.snp.makeConstraints{ make in
            make.width.height.equalTo(32)
            make.top.leading.equalToSuperview()
        }
        
        self.userNameLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.equalTo(profileImage.snp.trailing).offset(8)
        }
        
        self.messageLabel.snp.makeConstraints{ make in
            make.leading.equalTo(profileImage.snp.trailing).offset(8)
            make.top.equalToSuperview().offset(18)
            make.bottom.equalToSuperview()
            
            let maxWidth = 221 / 360 * Const.Device.DEVICE_WIDTH
            make.width.lessThanOrEqualTo(maxWidth)
        }
        
        self.timeLabel.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.leading.equalTo(messageLabel.snp.trailing).offset(4)
        }
    }
    
}
