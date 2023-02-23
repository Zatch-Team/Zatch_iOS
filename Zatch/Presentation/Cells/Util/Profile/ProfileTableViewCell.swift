//
//  ProfileTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/13.
//

import UIKit
import Cosmos

class ProfileTableViewCell: BaseTableViewCell {
    
    private let userImage = UIImageView().then{
        $0.backgroundColor = .black10
        $0.layer.cornerRadius = 100/2
    }
    private let userNameLabel = UILabel().then{
        $0.text = "userName"
        $0.setTypoStyleWithSingleLine(typoStyle: .bold16)
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
        $0.setTypoStyleWithSingleLine(typoStyle: .bold15)
        $0.textColor = .black85
    }
    private let moreButton = UIButton().then{
        var config = UIButton.Configuration.plain()
        var attText = AttributedString.init("더보기")
        
        attText.font = UIFont.pretendard(size: 12, family: .Medium)
        attText.foregroundColor = UIColor.black20
        config.attributedTitle = attText
        
        $0.configuration = config
    }
    private let reviewLabel = UILabel().then{
        $0.text = "“답장이 빠르고 친절하게 답해주세요.”"
        $0.setTypoStyleWithSingleLine(typoStyle: .medium14)
        $0.textColor = .black85
    }
    private let borderLine = ZatchComponent.SectionDivider()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
    
        userImage.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        userNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(userImage.snp.bottom).offset(13)
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
        borderLine.snp.makeConstraints{
            $0.top.equalTo(reviewLabel.snp.bottom).offset(24)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private func initialize(){
        
    }
    
    func bindingData(){
        
    }
}
