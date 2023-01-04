//
//  GatchDetailInfomationTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/02.
//

import UIKit

class GatchDetailInfomationTableViewCell: BaseTableViewCell, BaseCellProtocol {
    
    //MARK: - Properties
    static let cellIdentifier: String = "GatchDetailInfomationTableViewCell"
    
    let titleStackView = UIStackView().then{
        $0.spacing = 12
        $0.axis = .horizontal
    }
    let productName = UILabel().then{
        $0.text = "재치 양념치킨"
        $0.setTypoStyleWithSingleLine(typoStyle: .bold20)
        $0.textColor = .black85
    }
    let purchaseTag = PaddingLabel(padding: UIEdgeInsets(top: 4, left: 12, bottom: 4, right: 12)).then{
        $0.text = "구매후"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.setTypoStyleWithSingleLine(typoStyle: .medium15_19)
        $0.backgroundColor = .zatchDeepYellow
        
        $0.layer.cornerRadius = 28/2
        $0.clipsToBounds = true
    }
    
    let titleUnderDetailStackView = UIStackView().then{
        $0.spacing = 8
        $0.axis = .horizontal
    }
    let categoryLabel = UILabel().then{
        $0.text = "음식 | 조리"
        $0.setTypoStyleWithSingleLine(typoStyle: .medium14)
        $0.textColor = .black45
    }
    let timerStackView = UIStackView().then{
        $0.spacing = 2
        $0.axis = .horizontal
    }
    let timerImageView = UIImageView().then{
        $0.image = Image.timer
    }
    let timerLabel = UILabel().then{
        $0.text = "12:27:26"
        $0.textColor = .black45
        $0.setTypoStyleWithSingleLine(typoStyle: .medium14)
    }
    let heartStackView = UIStackView().then{
        $0.spacing = 2
        $0.axis = .horizontal
    }
    let heartImageView = UIImageView().then{
        $0.image = Image.heartSilverFill
    }
    let heartCountLabel = UILabel().then{
        $0.text = "13"
        $0.textColor = .black45
        $0.setTypoStyleWithSingleLine(typoStyle: .medium14)
    }
    
    let profileAndWithMemberView = UIView()
    let profileImageView = UIImageView().then{
        $0.layer.cornerRadius = 40/2
        $0.backgroundColor = .black20
    }
    let userInfoStackView = UIStackView().then{
        $0.spacing = 4
        $0.axis = .horizontal
    }
    let userNameLabel = UILabel().then{
        $0.text = "행복한 호랑이"
        $0.setTypoStyleWithSingleLine(typoStyle: .bold15)
        $0.textColor = .black85
    }
    let userTownLabel = UILabel().then{
        $0.text = "· 중계동"
        $0.setTypoStyleWithSingleLine(typoStyle: .medium14)
        $0.textColor = .black20
    }
    let withMemberImageStackView = UIStackView().then{
        $0.backgroundColor = .black20
    } //collectionView로 해야 하나...?
    
    let borderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    let productInfoStackView = UIStackView().then{
        $0.spacing = 12
        $0.axis = .vertical
        $0.alignment = .leading
    }
    let productPersonnelStackView = UIStackView().then{
        $0.spacing = 24
        $0.axis = .horizontal
    }
    let personnelTitleLabel = UILabel().then{
        $0.text = "인원"
        $0.textColor = .black85
        $0.setTypoStyleWithSingleLine(typoStyle: .bold16)
    }
    let personnelInfoLabel = UILabel().then{
        $0.text = "5 명"
        $0.textColor = .black85
        $0.setTypoStyleWithSingleLine(typoStyle: .medium16)
    }
    let productPriceStackView = UIStackView().then{
        $0.spacing = 24
        $0.axis = .horizontal
    }
    let priceTitleLabel = UILabel().then{
        $0.text = "금액"
        $0.textColor = .black85
        $0.setTypoStyleWithSingleLine(typoStyle: .bold16)
    }
    let priceDetailStackView = UIStackView().then{
        $0.spacing = 2
        $0.axis = .horizontal
    }
    let beforPriceLabel = UILabel().then{
        $0.text = "20,000 원"
        $0.textColor = .black20
        $0.setTypoStyleWithSingleLine(typoStyle: .medium16)
    }
    let priceArrowImageView = UIImageView().then{
        $0.image = Image.arrowChangeRight
    }
    let afterPriceLabel = UILabel().then{
        $0.text = "20,000 원"
        $0.textColor = .black85
        $0.setTypoStyleWithSingleLine(typoStyle: .medium16)
    }
    
    let handleRemainPersonnelView = UILabel().then{
        $0.text = "빈 자리는 모인 인원들과 1/n 할게요."
        $0.textAlignment = .center
        $0.setTypoStyleWithSingleLine(typoStyle: .medium15_19)
        $0.backgroundColor = .black5
        $0.textColor = .black85
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    let productExplainView = UILabel().then{
        $0.text = "추가 설명은 이렇고 저렇고 이렇습니다~ \n참고해주세요!\n새벽에 연락 안됩니다~"
        $0.setTypoStyleWithMultiLine(typoStyle: .regular16)
        $0.textColor = .black85
        $0.numberOfLines = 0
    }
    
    override func hierarchy() {
        
        super.hierarchy()
        
        self.baseView.addSubview(titleStackView)
        self.baseView.addSubview(titleUnderDetailStackView)
        self.baseView.addSubview(profileAndWithMemberView)
        self.baseView.addSubview(borderLine)
        self.baseView.addSubview(productInfoStackView)
        self.baseView.addSubview(handleRemainPersonnelView)
        self.baseView.addSubview(productExplainView)
        
        titleStackView.addArrangedSubview(productName)
        titleStackView.addArrangedSubview(purchaseTag)
        
        titleUnderDetailStackView.addArrangedSubview(categoryLabel)
        titleUnderDetailStackView.addArrangedSubview(timerStackView)
        titleUnderDetailStackView.addArrangedSubview(heartStackView)
        timerStackView.addArrangedSubview(timerImageView)
        timerStackView.addArrangedSubview(timerLabel)
        heartStackView.addArrangedSubview(heartImageView)
        heartStackView.addArrangedSubview(heartCountLabel)
        
        profileAndWithMemberView.addSubview(profileImageView)
        profileAndWithMemberView.addSubview(userInfoStackView)
        profileAndWithMemberView.addSubview(withMemberImageStackView)
        userInfoStackView.addArrangedSubview(userNameLabel)
        userInfoStackView.addArrangedSubview(userTownLabel)
        
        productInfoStackView.addArrangedSubview(productPersonnelStackView)
        productInfoStackView.addArrangedSubview(productPriceStackView)
        productPersonnelStackView.addArrangedSubview(personnelTitleLabel)
        productPersonnelStackView.addArrangedSubview(personnelInfoLabel)
        productPriceStackView.addArrangedSubview(priceTitleLabel)
        productPriceStackView.addArrangedSubview(priceDetailStackView)
        priceDetailStackView.addArrangedSubview(beforPriceLabel)
        priceDetailStackView.addArrangedSubview(priceArrowImageView)
        priceDetailStackView.addArrangedSubview(afterPriceLabel)
    }
    
    override func layout() {
        
        super.layout()
        
        titleStackView.snp.makeConstraints{
            $0.top.leading.equalToSuperview().offset(20)
            $0.height.equalTo(28)
            
        }
        setTitleStackViewLayout()
        
        titleUnderDetailStackView.snp.makeConstraints{
            $0.top.equalTo(titleStackView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(20)
        }
        setTitleUnderDetailStackView()
        
        profileAndWithMemberView.snp.makeConstraints{
            $0.top.equalTo(titleUnderDetailStackView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.equalTo(40)
        }
        setProfileAndWithMemeberViewLayout()
        
        borderLine.snp.makeConstraints{
            $0.top.equalTo(profileAndWithMemberView.snp.bottom).offset(20)
            $0.height.equalTo(1.5)
            $0.leading.trailing.equalToSuperview()
        }
        
        productInfoStackView.snp.makeConstraints{
            $0.top.equalTo(borderLine.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(20)
        }
        setProductInfoStackViewLayout()
        
        handleRemainPersonnelView.snp.makeConstraints{
            $0.top.equalTo(productInfoStackView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(43)
        }
        
        productExplainView.snp.makeConstraints{
            $0.top.equalTo(handleRemainPersonnelView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-120)
            $0.bottom.equalToSuperview()
        }
        
    }
    
    private func setTitleStackViewLayout(){
        productName.snp.makeConstraints{
            $0.top.leading.bottom.equalToSuperview()
        }
        purchaseTag.snp.makeConstraints{
            $0.trailing.height.equalToSuperview()
        }
    }
    
    private func setTitleUnderDetailStackView(){
        timerImageView.snp.makeConstraints{
            $0.height.equalToSuperview()
            $0.width.equalTo(timerImageView.snp.height)
        }
        heartImageView.snp.makeConstraints{
            $0.height.equalToSuperview()
            $0.width.equalTo(heartImageView.snp.height)
        }
    }
    
    private func setProfileAndWithMemeberViewLayout(){
        profileImageView.snp.makeConstraints{
            $0.leading.height.equalToSuperview()
            $0.width.equalTo(profileImageView.snp.height)
        }
        userInfoStackView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(profileImageView.snp.trailing).offset(8)
        }
        withMemberImageStackView.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(4)
            $0.centerY.equalToSuperview()
        }
    }
    
    
    private func setProductInfoStackViewLayout(){
        priceArrowImageView.snp.makeConstraints{
            $0.height.equalToSuperview()
            $0.width.equalTo(priceArrowImageView.snp.height)
        }
    }
}
