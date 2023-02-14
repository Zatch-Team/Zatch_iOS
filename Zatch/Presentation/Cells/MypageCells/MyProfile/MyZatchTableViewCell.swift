//
//  MyZatchTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/13.
//

import UIKit

class MyZatchTableViewCell: BaseTableViewCell {
    
    // 재치 내용
    let zatchImage = UIImageView().then{
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 4
    }
    let zatchStackView = UIStackView().then{
        $0.spacing = 4
        $0.axis = .vertical
        $0.alignment = .leading
    }
    let myZatchName = UILabel().then{
        $0.text = "삼다수 생수 1L"
        $0.font = UIFont.pretendard(size: 17, family: .Bold)
    }
    let tradeImg = UIImageView().then{
        $0.image = Image.exchangeVerticalSilver
    }
    let otherZatchName = UILabel().then{
        $0.text = "신라면 3봉"
        $0.font = UIFont.pretendard(size: 17, family: .Bold)
    }
    
    let nicknameAndTownLabel = UILabel().then{
        $0.text = "냥냥이 · 불광동"
        $0.setTypoStyleWithSingleLine(typoStyle: .regular14_18)
    }

    let countInformationStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 8
    }
    let heartCountView = IconAndNumberView(icon: Image.profileEmptyHeart).then{
        $0.setNumber(count: 15)
    }
    let chatCountView = IconAndNumberView(icon: Image.profileChat).then{
        $0.setNumber(count: 2)
    }
    let borderLine = ZatchComponent.BorderLine(color: .black5, height: 1.5)

    
    // heart
    lazy var heartButton = UIButton().then{
        $0.setImage(Image.heartSilver, for: .selected)
        $0.setImage(Image.heartSilver, for: .normal)
    }
    // MARK: - LifeCycles
    
    override func style() {
        heartButton.isHidden = true
        heartButton.addTarget(self, action: #selector(heartButtonDidTap), for: .touchUpInside)
    }

    // MARK: - Actions
    @objc func heartButtonDidTap() {
        if heartButton.isSelected {heartButton.isSelected = false}
        else {heartButton.isSelected = true}
    }
    
    // MARK: - Functions
    override func hierarchy() {
        
        super.hierarchy()
        
        baseView.addSubview(zatchImage)
        baseView.addSubview(zatchStackView)
        baseView.addSubview(nicknameAndTownLabel)
        baseView.addSubview(countInformationStackView)
        baseView.addSubview(heartButton)
        baseView.addSubview(borderLine)
        
        zatchStackView.addArrangedSubview(myZatchName)
        zatchStackView.addArrangedSubview(tradeImg)
        zatchStackView.addArrangedSubview(otherZatchName)
        
        countInformationStackView.addArrangedSubview(heartCountView)
        countInformationStackView.addArrangedSubview(chatCountView)
    }
    
    override func layout() {
        
        super.layout()
        
        zatchImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(108)
        }
        zatchStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalTo(zatchImage.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(55)
        }
        tradeImg.snp.makeConstraints {
            $0.width.height.equalTo(20)
            $0.leading.equalToSuperview()
        }
        
        nicknameAndTownLabel.snp.makeConstraints {
            $0.leading.equalTo(zatchStackView)
            $0.bottom.equalToSuperview().offset(-20)
        }
        countInformationStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-24)
            $0.bottom.equalToSuperview().offset(-20)
        }
        heartButton.snp.makeConstraints {
            $0.width.height.equalTo(28)
            $0.trailing.top.equalToSuperview().inset(20)
        }
        borderLine.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.centerX.bottom.equalToSuperview()
        }
    }
 
    // Heart
    func addHeartToCell(color: String) {
        if color == "purple" {heartButton.setImage(Image.heartPurple, for: .selected)}
        else {heartButton.setImage(Image.heartYellow, for: .selected)}
        
        heartButton.isHidden = false
    }
}

extension MyZatchTableViewCell{
    
    class IconAndNumberView: UIStackView{
        private let iconImage = UIImageView()
        private let numberLabel = UILabel().then{
            $0.setTypoStyleWithSingleLine(typoStyle: .medium15_19)
            $0.textColor = .black20
        }
        
        init(icon: UIImage){
            self.iconImage.image = icon
            super.init(frame: .zero)
            initialize()
        }
        
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func initialize(){
            self.spacing = 4
            self.axis = .horizontal
            hierarchy()
            layout()
        }
        
        private func hierarchy(){
            self.addArrangedSubview(iconImage)
            self.addArrangedSubview(numberLabel)
        }
        
        private func layout(){
            iconImage.snp.makeConstraints{
                $0.width.height.equalTo(20)
            }
        }
        
        func setNumber(count: Int){
            numberLabel.text = "\(count)"
        }
    }
}
