//
//  MainCollectionViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/06.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    static var identifier = "MainCollectionViewCell"
    
    let image = UIImageView().then{
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 8
    }
    let title = UILabel().then{
        $0.text = "title"
        $0.font = UIFont.pretendard(size: 13, family: .Bold)
        $0.numberOfLines = 0
        $0.textColor = .black
    }
    let location = UILabel().then{
        $0.text = "location"
        $0.font = UIFont.pretendard(size: 10, family: .Bold)
        $0.numberOfLines = 0
        $0.textColor = .lightGray
    }
    let time = UILabel().then{
        $0.text = "time"
        $0.font = UIFont.pretendard(size: 10, family: .Bold)
        $0.numberOfLines = 0
        $0.textColor = .lightGray
    }
    let stackView = UIStackView()
    // 교환을 원하는 재치
    let label = UILabel().then{
        $0.text = "교환을 원하는 재치"
        $0.font = UIFont.pretendard(size: 10, family: .Bold)
        $0.numberOfLines = 0
        $0.textColor = .black
    }
    let zatchItem = UILabel().then{
        $0.text = "Item"
        $0.font = UIFont.pretendard(size: 13, family: .Bold)
        $0.numberOfLines = 0
        $0.textColor = UIColor(named: "Zatch-Purple")
    }
    let heart = UIButton().then{
        $0.setImage(UIImage(named: "heart_silver"), for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(location)
        contentView.addSubview(time)
        contentView.addSubview(stackView)
        
        stackView.addSubview(label)
        stackView.addSubview(zatchItem)
        stackView.addSubview(heart)
    }
    func setUpConstraint() {
        image.snp.makeConstraints { make in
            make.width.equalTo(124)
            make.height.equalTo(120)
            make.leading.trailing.top.equalToSuperview()
        }
        title.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.leading)
            make.trailing.equalTo(image.snp.trailing)
            make.top.equalTo(image.snp.bottom).offset(12)
        }
        location.snp.makeConstraints { make in
            make.leading.equalTo(title.snp.leading)
            make.top.equalTo(title.snp.bottom).offset(4)
        }
        time.snp.makeConstraints { make in
            make.centerY.equalTo(location)
            make.leading.equalTo(location.snp.trailing)
        }
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.bottom.equalToSuperview().offset(-6)
        }
        label.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
        }
        zatchItem.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(label.snp.bottom)
        }
        heart.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.bottom.trailing.top.equalToSuperview()
        }
    }
}
