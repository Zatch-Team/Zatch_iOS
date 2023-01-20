//
//  MyInfoTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/12.
//

import UIKit

class MyInfoTableViewCell: UITableViewCell {
    let backView = UIView().then{
        $0.backgroundColor = .white
    }
    let userImage = UIImageView().then{
        $0.backgroundColor = .systemGray4
        $0.layer.cornerRadius = 50
    }
    let userName = UILabel().then{
        $0.text = "userName"
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }
    lazy var goProfileButton = WhitePurpleButton().then{
        $0.setTitle("프로필 보기", for: .normal)
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
    func setUpView() {
        contentView.backgroundColor = .systemGray5
        contentView.addSubview(backView)
        backView.addSubview(userImage)
        backView.addSubview(userName)
        backView.addSubview(goProfileButton)
    }
    func setUpConstraint() {
        backView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(224)
        }
        userImage.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        userName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(userImage.snp.bottom).offset(12)
        }
        goProfileButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(73)
            make.height.equalTo(36)
            make.centerX.equalToSuperview()
            make.top.equalTo(userName.snp.bottom).offset(12)
        }
    }
}
