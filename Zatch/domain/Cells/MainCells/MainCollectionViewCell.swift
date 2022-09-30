//
//  MainCollectionViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/06.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    static var identifier = "MainCollectionViewCell"
    
    // 아이템 이미지
    let image = UIImageView().then{
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 8
    }
    // 아이템 이름
    let title = UILabel().then{
        $0.text = "title"
        $0.font = UIFont.pretendard(size: 13, family: .Bold)
        $0.numberOfLines = 1
        $0.textColor = .black
    }
    // 위치
    let location = UILabel().then{
        $0.text = "location"
        $0.font = UIFont.pretendard(size: 10, family: .Bold)
        $0.numberOfLines = 0
        $0.textColor = .lightGray
    }
    // 시간 (몇 시간 전)
    let time = UILabel().then{
        $0.text = "time"
        $0.font = UIFont.pretendard(size: 10, family: .Bold)
        $0.numberOfLines = 0
        $0.textColor = .lightGray
    }
    let stackView = UIStackView().then{
        $0.axis = .vertical
        $0.spacing = 0
    }
    // '교환을 원하는 재치' (라벨)
    let label = UILabel().then{
        $0.text = "교환을 원하는 재치"
        $0.font = UIFont.pretendard(size: 10, family: .Bold)
        $0.numberOfLines = 0
        $0.textColor = .black
    }
    // 교환을 원하는 아이템
    let zatchItem = UILabel().then{
        $0.text = "Item"
        $0.font = UIFont.pretendard(size: 13, family: .Bold)
        $0.numberOfLines = 0
        $0.textColor = .zatchPurple
    }
    // 하트
    let heart = UIButton().then{
        // state별로 이미지 설정
        $0.setImage(UIImage(named: "heart_silver"), for: .normal)
        $0.setImage(UIImage(named: "filledHeart"), for: .selected)
    }
    // MARK: Properties
    private let mainViewModel: MainViewModel = MainViewModel()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUpView()
        setUpConstraint()
        
        heart.addTarget(self, action: #selector(heartBtnDidTap), for: .touchUpInside)
        bind()
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
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(zatchItem)
        contentView.addSubview(heart)
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
            make.leading.equalTo(location.snp.trailing).offset(4)
        }
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview().offset(-18)
        }
        heart.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.top.equalTo(stackView)
            make.trailing.equalToSuperview()
        }
    }
}
extension MainCollectionViewCell {
    // MARK: - Actions
    @objc func heartBtnDidTap(_ sender: UIButton) {
        let state = sender.state
        mainViewModel.heartButtonDidTap(state)
    }
    //MARK: - Methods
    private func bind() {
        mainViewModel.heartState.bind { heartState in
            guard let state = heartState else {return}
            switch state.rawValue {
            case 4:
                self.heart.isSelected = true
            default:
                self.heart.isSelected = false
            }
        }
    }
}
