//
//  CheckShareRegisterInfoView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/23.
//

import UIKit

class CheckShareRegisterInfoView: BaseView{
    
    let tagStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 4
    }
    let shareTag = ZatchComponent.YellowTag(configuration: .height20).then{
        $0.setTitle("나눔")
    }
    let myProductCategoryTag = ZatchComponent.PurlpleTag(configuration: .height20).then{
        $0.setCategoryTitle(categoryId: 2)
    }
    let myProductNameLabel = UILabel().then{
        $0.text = "맥도날드 해피밀 마이멜로디 장난감"
        $0.textColor = .black85
        $0.setTypoStyleWithSingleLine(typoStyle: .medium12)
    }
    let myProductDetail = CheckRegisterView.MyProductDetailView()
    
    override func hierarchy() {
        self.addSubview(tagStackView)
        self.addSubview(myProductNameLabel)
        self.addSubview(myProductDetail)
        
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
        myProductDetail.snp.makeConstraints{
            $0.top.equalTo(myProductNameLabel.snp.bottom).offset(22)
            $0.leading.equalToSuperview().offset(36)
        }
    }
}
