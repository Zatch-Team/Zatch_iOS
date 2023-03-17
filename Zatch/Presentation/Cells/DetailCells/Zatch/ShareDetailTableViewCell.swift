//
//  ShareDetailTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/28.
//

import UIKit

class ShareDetailTableViewCell: BaseTableViewCell {
    
    //MARK: - UI
    let shareTag = PaddingLabel(padding: ZatchComponent.Padding(left: 8, right: 8, top: 2, bottom: 2)).then{
        $0.text = "나눔"
        $0.textColor = .zatchDeepYellow
        $0.backgroundColor = .yellow40
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.layer.cornerRadius = 20/2
        $0.clipsToBounds = true
    }

    let categoryTag = PaddingLabel(padding: ZatchComponent.Padding(left: 8, right: 8, top: 2, bottom: 2)).then{
        $0.text = "생활용품"
        $0.textColor = .zatchPurple
        $0.backgroundColor = .purple40
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.layer.cornerRadius = 20/2
        $0.clipsToBounds = true
    }
    
    let productLabel = UILabel().then{
        $0.numberOfLines = 1
        $0.textAlignment = .center
        $0.text = "몰랑이 피규어"
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }
    
    let productStackView = UIStackView().then{
        $0.axis = .vertical
        $0.spacing = 4
        $0.alignment = .center
    }
    
    let borderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    //MARK: - LifeCycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstriant()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        self.baseView.addSubview(productStackView)
        self.baseView.addSubview(shareTag)
        self.baseView.addSubview(borderLine)
        
        self.productStackView.addArrangedSubview(categoryTag)
        self.productStackView.addArrangedSubview(productLabel)
    }
    
    func setUpConstriant(){
        
        productStackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        shareTag.snp.makeConstraints{
            $0.trailing.equalTo(categoryTag.snp.leading).offset(-6)
            $0.centerY.equalTo(categoryTag)
            $0.height.equalTo(20)
        }
        
        categoryTag.snp.makeConstraints{
            $0.height.equalTo(20)
        }
        
        borderLine.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(productStackView.snp.bottom).offset(16)
            $0.height.equalTo(1)
        }
    }
}
