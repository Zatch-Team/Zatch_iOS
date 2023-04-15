//
//  ProfileTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/13.
//

import UIKit
import Cosmos

class ProfileTableViewCell: BaseTableViewCell {
    
    var delegate: ProfileMoreDelegate?
    
    private let userImage = UIImageView().then{
        $0.backgroundColor = .black10
        $0.layer.cornerRadius = Const.Constraint.profileImageSize/2
    }
    private let userNameLabel = UILabel().then{
        $0.text = "userName"
        $0.setTypoStyleWithSingleLine(typoStyle: .bold18)
    }
    // star
    private let starView = CosmosView().then{
        $0.rating = 4
        $0.settings.updateOnTouch = false
        $0.settings.fillMode = .full
        $0.settings.starSize = 24
        $0.settings.starMargin = 0
        $0.settings.filledImage = Image.filledStar
        $0.settings.emptyImage = Image.emptyStar
    }
    // 한 줄 후기
    private let titleLabel = UILabel().then{
        $0.text = "한 줄 후기"
        $0.setTypoStyleWithSingleLine(typoStyle: .bold17)
        $0.textColor = .black85
    }
    private let moreButton = UIButton().then{
        var config = UIButton.Configuration.plain()
        var attText = AttributedString.init("더보기")
        
        attText.font = UIFont.pretendard(size: 14, family: .Medium)
        attText.foregroundColor = UIColor.black20
        config.attributedTitle = attText
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        $0.configuration = config
    }
    private let reviewLabel = UILabel().then{
        $0.text = "“답장이 빠르고 친절하게 답해주세요.”"
        $0.setTypoStyleWithSingleLine(typoStyle: .medium16)
        $0.textColor = .black85
    }
    private let borderLine = ZatchComponent.SectionDivider()

    // MARK: - Functions
    
    override func hierarchy() {
        
        super.hierarchy()

        baseView.addSubview(userImage)
        baseView.addSubview(userNameLabel)
        baseView.addSubview(starView)
        baseView.addSubview(titleLabel)
        baseView.addSubview(moreButton)
        baseView.addSubview(reviewLabel)
        baseView.addSubview(borderLine)
    }
    
    override func layout() {
        
        super.layout()
    
        userImage.snp.makeConstraints{
            $0.width.height.equalTo(Const.Constraint.profileImageSize)
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
        }
        userNameLabel.snp.makeConstraints{
            $0.top.equalTo(userImage.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        starView.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(8)
            $0.width.equalTo(120)
            $0.height.equalTo(28)
            $0.centerX.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(starView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(20)
        }
        moreButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().inset(20)
        }
        reviewLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
        }
        borderLine.snp.makeConstraints{
            $0.top.equalTo(reviewLabel.snp.bottom).offset(20)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    override func initialize(){
        moreButton.addTarget(self, action: #selector(moreButtonDidTapped), for: .touchUpInside)
    }
    
    @objc private func moreButtonDidTapped(){
        delegate?.willMoveReviewViewController()
    }
    
    func bindingData(){
        
    }
}
