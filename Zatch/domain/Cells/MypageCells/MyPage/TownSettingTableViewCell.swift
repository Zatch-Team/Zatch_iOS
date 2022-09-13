//
//  TownSettingTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/12.
//

import UIKit

class TownSettingTableViewCell: UITableViewCell {
    let backView = UIView().then{
        $0.backgroundColor = .white
    }
    let titleLabel = UILabel().then{
        $0.text = "내 동네 관리"
        $0.font = UIFont.pretendard(size: 15, family: .Bold)
    }
    let settingIcon = UIImageView().then{
        $0.image = UIImage(named: "pin")
    }
    let setTownLabel = UILabel().then{
        $0.text = "내 동네 설정"
        $0.font = UIFont.pretendard(size: 15, family: .Regular)
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
        
        backView.addSubview(titleLabel)
        backView.addSubview(settingIcon)
        backView.addSubview(setTownLabel)
    }
    func setUpConstraint() {
        backView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(20)
        }
        settingIcon.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.leading.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(22)
        }
        setTownLabel.snp.makeConstraints { make in
            make.leading.equalTo(settingIcon.snp.trailing).offset(8)
            make.centerY.equalTo(settingIcon)
        }
    }
}
