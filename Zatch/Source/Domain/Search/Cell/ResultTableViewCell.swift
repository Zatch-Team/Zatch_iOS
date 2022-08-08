//
//  ResultTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/02.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    let productImage = UIImageView()
    let myProduct = UILabel()
    let wantProduct = UILabel()
    let exchangeImage = UIImageView()
    let etcInfoText = UILabel()
    let heartButton = UIButton()
    
    let productStackView = UIStackView()
    
    let selectedView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectedBackgroundView = selectedView
        
        setUpView()
        setUpValue()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpValue(){
        
        productImage.backgroundColor = .black45
        productImage.layer.cornerRadius = 4
        
        myProduct.text = "삼다수 생수 1L"
        myProduct.textColor = .black85
        myProduct.font = UIFont.pretendard(family: .Bold)
        
        wantProduct.text = "신라면 3봉"
        wantProduct.textColor = .black85
        wantProduct.font = UIFont.pretendard(family: .Bold)
        
        etcInfoText.text = "냥냥이 · 불광동"
        etcInfoText.textColor = .black65
        etcInfoText.font = UIFont.pretendard(size: 12)
        
        exchangeImage.image = UIImage(named: "exchange_vertical_silver")
        
        productStackView.axis = .vertical
        productStackView.spacing = 4
        productStackView.alignment = .leading
        
        heartButton.setImage(UIImage(named: "heart"), for: .normal)
        heartButton.setImage(UIImage(named: "heart_yellow"), for: .selected)
        heartButton.addTarget(self, action: #selector(heartButtonTouchUp), for: .touchUpInside)
        
    }
    
    func setUpView(){
        
        self.contentView.addSubview(productImage)
        
        self.productStackView.addArrangedSubview(myProduct)
        self.productStackView.addArrangedSubview(exchangeImage)
        self.productStackView.addArrangedSubview(wantProduct)
        
        self.contentView.addSubview(productStackView)
        self.contentView.addSubview(etcInfoText)
        self.contentView.addSubview(heartButton)
    }
    
    func setUpConstraint(){
        
        self.contentView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(138)
        }
        
        self.productImage.snp.makeConstraints{ make in
            make.size.equalTo(CGSize(width: 100, height: 100))
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
        }
        
        self.exchangeImage.snp.makeConstraints{ make in
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        
        self.productStackView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalTo(productImage.snp.trailing).offset(16)
            make.trailing.equalTo(heartButton.snp.leading).offset(16)
        }
        
        self.etcInfoText.snp.makeConstraints{ make in
            make.top.equalTo(productStackView.snp.bottom).offset(12)
            make.leading.equalTo(productStackView)
        }
        
        self.heartButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }

    //MARK: Action
    @objc
    func heartButtonTouchUp(){
        if heartButton.isSelected{
            heartButton.isSelected = false
        }else{
            heartButton.isSelected = true
        }
    }
}
