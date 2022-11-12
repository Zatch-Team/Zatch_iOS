//
//  LeftChattingImageTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/30.
//

import UIKit

class LeftChattingImageTableViewCell: BaseTableViewCell {
    //MARK: - Properties
    
    static let cellIdentifier = "leftImageCell"
    
    //MARK: - UI
    
    let profileImage = UIImageView().then{
        $0.image = Image.zatchProfile
    }
    
    let userNameLabel = UILabel().then{
        $0.textColor = .black
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.numberOfLines = 1
        $0.text = "쑤야"
    }
    
    let imageMessageView = UIImageView().then{
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
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
        baseView.addSubview(imageMessageView)
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
        
        self.imageMessageView.snp.makeConstraints{ make in
            make.leading.equalTo(profileImage.snp.trailing).offset(8)
            make.top.equalToSuperview().offset(18)
            make.bottom.equalToSuperview()
            
            make.width.height.lessThanOrEqualTo(200 / 360 * Const.Device.DEVICE_WIDTH)
        }
        
        self.timeLabel.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.leading.equalTo(imageMessageView.snp.trailing).offset(4)
        }
    }
}
