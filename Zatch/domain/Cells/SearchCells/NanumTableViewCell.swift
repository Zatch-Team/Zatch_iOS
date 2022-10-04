//
//  NanumTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/10/04.
//

import UIKit

class NanumTableViewCell: UITableViewCell {
    let backView = UIView().then{
        $0.backgroundColor = .white
    }
    // 나눔인 경우
    let nanumTag = PaddingLabel().then{
        $0.text = "나눔"
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textColor = .zatchDeepYellow
        $0.backgroundColor = .yellow40
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    // 나의 재치 내용
    let zatchImage = UIImageView().then{
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 4
    }
    let myZatchName = UILabel().then{
        $0.text = "삼다수 생수 1L"
        $0.font = UIFont.pretendard(size: 14, family: .Bold)
    }
    let horizontalStackWith2 = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 2
    }
    let peopleLabel = UILabel().then{
        $0.text = "냥냥이"
        $0.font = UIFont.pretendard(size: 12, family: .Regular)
    }
    let label = UILabel().then{
        $0.text = "."
        $0.font = UIFont.pretendard(size: 12, family: .Regular)
    }
    let locationLabel = UILabel().then{
        $0.text = "불광동"
        $0.font = UIFont.pretendard(size: 12, family: .Regular)
    }
    let horizontalStackWith8 = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 8
    }
    // heart
    lazy var heartButton = UIButton().then{
        $0.setImage(UIImage(named: "heart_yellow"), for: .selected)
        $0.setImage(UIImage(named: "heart_silver"), for: .normal)
    }
    // MARK: - LifeCycles
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstraint()
        
        heartButton.addTarget(self, action: #selector(heartButtonDidTap), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Actions
    @objc func heartButtonDidTap() {
        if heartButton.isSelected {heartButton.isSelected = false}
        else {heartButton.isSelected = true}
    }
    // MARK: - Functions
    func setUpView() {
        contentView.backgroundColor = .systemGray5
        contentView.addSubview(backView)
        
        backView.addSubview(zatchImage)
        backView.addSubview(myZatchName)
        backView.addSubview(nanumTag)
        
        backView.addSubview(horizontalStackWith2)
        horizontalStackWith2.addArrangedSubview(peopleLabel)
        horizontalStackWith2.addArrangedSubview(label)
        horizontalStackWith2.addArrangedSubview(locationLabel)
        
        backView.addSubview(horizontalStackWith8)
        
        horizontalStackWith8.addArrangedSubview(setProfileStack("profile_emptyHeart", 15))
        horizontalStackWith8.addArrangedSubview(setProfileStack("profile_chat", 2))
        
        backView.addSubview(heartButton)
    }
    func setUpConstraint() {
        backView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        zatchImage.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
        }
        nanumTag.snp.makeConstraints { make in
            make.leading.equalTo(myZatchName)
            make.top.equalTo(zatchImage)
        }
        myZatchName.snp.makeConstraints { make in
            make.top.equalTo(nanumTag.snp.bottom).offset(10)
            make.leading.equalTo(zatchImage.snp.trailing).offset(16)
            make.trailing.equalToSuperview().inset(20)
        }
        horizontalStackWith2.snp.makeConstraints { make in
            make.leading.equalTo(myZatchName)
            make.bottom.equalTo(zatchImage)
        }
        horizontalStackWith8.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalTo(locationLabel)
        }
        heartButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.trailing.top.equalToSuperview().inset(16)
        }
    }
    func setProfileStack(_ img: String, _ count: Int) -> UIStackView {
        let stack = UIStackView().then{
            $0.axis = .horizontal
            $0.spacing = 4
        }
        let iconImg = UIImageView().then{
            $0.image = UIImage(named: img)
        }
        let countLabel = UILabel().then{
            $0.text = String(count)
            $0.font = UIFont.pretendard(size: 12, family: .Medium)
            $0.textColor = .black20
        }
        stack.addArrangedSubview(iconImg)
        stack.addArrangedSubview(countLabel)
        
        return stack
    }
}