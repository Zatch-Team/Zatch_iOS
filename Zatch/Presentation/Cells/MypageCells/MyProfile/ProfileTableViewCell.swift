//
//  ProfileTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/13.
//

import UIKit
import Cosmos

class ProfileTableViewCell: UITableViewCell {
    let backView = UIView().then{
        $0.backgroundColor = .white
    }
    let userImage = UIImageView().then{
        $0.backgroundColor = .systemGray4
        $0.layer.cornerRadius = 50
    }
    var userNameLabel = UILabel().then{
        $0.text = "userName"
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }
    // star
    let starView = CosmosView().then{
        $0.rating = 4
        $0.settings.updateOnTouch = true
        $0.settings.fillMode = .full
        $0.settings.starSize = 24
        $0.settings.starMargin = 0
        $0.settings.filledImage = Image.filledStar
        $0.settings.emptyImage = Image.emptyStar
    }
    // 한 줄 후기
    let titleLabel = UILabel().then{
        $0.text = "한 줄 후기"
        $0.font = UIFont.pretendard(size: 15, family: .Bold)
    }
    let moreButton = UIButton().then{
        var config = UIButton.Configuration.plain()
        var attText = AttributedString.init("더보기")
        
        attText.font = UIFont.pretendard(size: 12, family: .Medium)
        attText.foregroundColor = UIColor.black20
        config.attributedTitle = attText
        
        $0.configuration = config
    }
    let reviewLabel = UILabel().then{
        $0.text = "“답장이 빠르고 친절하게 답해주세요.”"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
    }

    // MARK: - LifeCycles
    var userName: String!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstraint()
        userNameLabel.text = self.userName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Functions
    func setUpView() {
        contentView.backgroundColor = .systemGray5
        contentView.addSubview(backView)
        
        backView.addSubview(userImage)
        backView.addSubview(userNameLabel)
        backView.addSubview(starView)
        backView.addSubview(titleLabel)
        backView.addSubview(moreButton)
        backView.addSubview(reviewLabel)
    }
    func setUpConstraint() {
        backView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8)
        }
        userImage.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        userNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(userImage.snp.bottom).offset(12)
        }
        starView.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(24)
            make.centerX.equalToSuperview()
            make.top.equalTo(userNameLabel.snp.bottom).offset(12)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(starView.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(20)
        }
        moreButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.trailing.equalToSuperview().offset(-20)
        }
        reviewLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(14)
        }
    }
}
