//
//  CheckShareRegisterInfoView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/23.
//

import UIKit

class CheckShareRegisterInfoView: BaseView, MyProductInformationView{
    
    let tagStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 4
    }
    let shareTag = ZatchComponent.Tag.filled(color: .yellow, configuration: .height20).then{
        $0.setTitle("나눔")
    }
    let myProductCategoryTag = ZatchComponent.Tag.filled(color: .purple, configuration: .height20)

    let myProductNameLabel = UILabel().then{
        $0.textColor = .black85
        $0.setTypoStyleWithSingleLine(typoStyle: .medium12)
    }
    
    let myProductDetailView = CheckRegisterView.MyProductDetailView()
    
    override func hierarchy() {
        addSubview(tagStackView)
        addSubview(myProductNameLabel)
        addSubview(myProductDetailView)
        
        tagStackView.addArrangedSubview(shareTag)
        tagStackView.addArrangedSubview(myProductCategoryTag)
    }
    
    override func layout() {
        tagStackView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(37)
        }
        myProductNameLabel.snp.makeConstraints{
            $0.top.equalTo(tagStackView.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(36)
        }
        myProductDetailView.snp.makeConstraints{
            $0.top.equalTo(myProductNameLabel.snp.bottom).offset(22)
            $0.leading.equalToSuperview().offset(36)
        }
    }
}
