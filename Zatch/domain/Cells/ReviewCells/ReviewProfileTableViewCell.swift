//
//  ReviewProfileTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/10/05.
//

import UIKit
import Cosmos

class ReviewProfileTableViewCell: UITableViewCell {
    let userImage = UIImageView().then{
        $0.backgroundColor = .systemGray4
        $0.layer.cornerRadius = 50
    }
    var userNameLabel = UILabel().then{
        $0.text = "userName"
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.textAlignment = .center
    }
    // star
    let starView = CosmosView().then{
        $0.rating = 4
        $0.settings.updateOnTouch = true
        $0.settings.fillMode = .full
        $0.settings.starSize = 24
        $0.settings.starMargin = 0
        $0.settings.filledImage = UIImage(named: "filledStar")
        $0.settings.emptyImage = UIImage(named: "emptyStar")
    }
    // 거래는 어떠셨나요?
    let myMessageLabel = PaddingLabel(padding: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)).then{
        $0.layer.cornerRadius = 14
        $0.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMinXMinYCorner)
        $0.backgroundColor = .zatchDeepYellow
        $0.clipsToBounds = true
        $0.textColor = .white
        $0.font = UIFont.pretendard(size: 14, family: .Regular)
        $0.numberOfLines = 0
        $0.textAlignment = .right
        
        $0.text = "님과의 거래는 어떠셨나요?"
    }
    

    // MARK: - LifeCycles
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Functions
    func setUpName(name: String) {
        userNameLabel.text = name
        myMessageLabel.text = "\(name)님과의 거래는 어떠셨나요?"
    }
    func setUpView() {
        contentView.addSubview(userImage)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(starView)
        contentView.addSubview(myMessageLabel)
        
    }
    func setUpConstraint() {
        userImage.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.top.equalToSuperview().offset(12)
            make.centerX.equalToSuperview()
        }
        userNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(userImage.snp.bottom).offset(18)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        starView.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(24)
            make.centerX.equalToSuperview()
            make.top.equalTo(userNameLabel.snp.bottom).offset(12)
        }
        myMessageLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
//            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(starView.snp.bottom).offset(32)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
