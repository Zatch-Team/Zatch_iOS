//
//  OtherReviewTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/10/05.
//

import UIKit
import Cosmos

class OtherReviewTableViewCell: UITableViewCell {
    let profileImage = UIImageView().then{
        $0.image = UIImage(named: "gatch_profile")
    }
    let userNameLabel = UILabel().then{
        $0.textColor = .black
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.numberOfLines = 1
        $0.text = "긍정적인올빼미0139"
    }
    
    let messageLabel = PaddingLabel(padding: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)).then{
        $0.layer.cornerRadius = 14
        $0.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner)
        $0.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
        $0.clipsToBounds = true
        $0.textColor = UIColor(red: 38/255, green: 38/255, blue: 38/255, alpha: 1)
        $0.font = UIFont.pretendard(size: 14, family: .Regular)
        $0.numberOfLines = 0
        $0.textAlignment = .left
        
        $0.text = "답장이 빠르고 친절하게 답해주세요."
    }
    // star
    let starView = CosmosView().then{
        $0.rating = 4
        $0.settings.updateOnTouch = true
        $0.settings.fillMode = .full
        $0.settings.starSize = 16
        $0.settings.starMargin = 0
        $0.settings.filledImage = UIImage(named: "filledStar")
        $0.settings.emptyImage = UIImage(named: "emptyStar")
    }
    // MARK: - LifeCycles
    var reviewDate: String!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Functions
    func setUpView() {
        contentView.addSubview(profileImage)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(messageLabel)
        contentView.addSubview(starView)
    }
    func setUpConstraint() {
        profileImage.snp.makeConstraints { make in
            make.width.height.equalTo(32)
            make.leading.top.equalToSuperview()
        }
        userNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(8)
            make.top.equalTo(profileImage)
            make.trailing.equalToSuperview()
        }
        messageLabel.snp.makeConstraints { make in
            make.leading.equalTo(userNameLabel)
            make.top.equalTo(userNameLabel.snp.bottom).offset(2)
//            make.trailing.equalToSuperview().offset(-21)
        }
        starView.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(16)
            make.trailing.equalTo(messageLabel)
            make.top.equalTo(messageLabel.snp.bottom)
            make.bottom.equalToSuperview()
        }
    }
}