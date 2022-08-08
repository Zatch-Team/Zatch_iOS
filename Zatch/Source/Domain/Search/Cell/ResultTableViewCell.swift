//
//  ResultTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/02.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    let productImage = UIImageView().then{
        $0.backgroundColor = .black45
        $0.layer.cornerRadius = 4
    }
    
    let myProduct = UILabel().then{
        $0.text = "삼다수 생수 1L"
        $0.textColor = .black85
        $0.font = UIFont.pretendard(family: .Bold)
    }
    
    let wantProduct = UILabel().then{
        $0.text = "신라면 3봉"
        $0.textColor = .black85
        $0.font = UIFont.pretendard(family: .Bold)
    }
    
    let exchangeImage = UIImageView().then{
        $0.image = UIImage(named: "exchange_vertical_silver")
    }
    
    let etcInfoText = UILabel().then{
        $0.text = "냥냥이 · 불광동"
        $0.textColor = .black65
        $0.font = UIFont.pretendard(size: 12)
    }
    
    let heartButton = UIButton().then{
        $0.setImage(UIImage(named: "heart"), for: .normal)
        $0.setImage(UIImage(named: "heart_yellow"), for: .selected)
        $0.addTarget(self, action: #selector(heartButtonTouchUp), for: .touchUpInside)
    }
    
    let productStackView = UIStackView().then{
        $0.axis = .vertical
        $0.spacing = 4
        $0.alignment = .leading
    }
    
    let separatorLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    let backView = UIView().then{
        $0.backgroundColor = .white
    }
    
    let selectedView = UIView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectedBackgroundView = selectedView
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setUpView(){
        
        self.contentView.addSubview(backView)
        
        self.backView.addSubview(productImage)
        
        self.productStackView.addArrangedSubview(myProduct)
        self.productStackView.addArrangedSubview(exchangeImage)
        self.productStackView.addArrangedSubview(wantProduct)
        
        self.backView.addSubview(productStackView)
        self.backView.addSubview(etcInfoText)
        self.backView.addSubview(heartButton)
        self.backView.addSubview(separatorLine)
    }
    
    func setUpConstraint(){
        
        self.contentView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(138)
        }
        
        self.backView.snp.makeConstraints{ make in
            make.leading.trailing.top.bottom.equalToSuperview()
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
        
        self.separatorLine.snp.makeConstraints{ make in
            make.height.equalTo(1)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
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
