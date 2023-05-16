//
//  ShareDetailTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/28.
//

import UIKit

final class ShareDetailTableViewCell: BaseTableViewCell, BindingZatch {

    private let shareTag = ZatchComponent.Tag.filled(color: .yellow, configuration: .height20).then{
        $0.setTitle("나눔")
    }

    private let categoryTag = ZatchComponent.Tag.filled(color: .purple, configuration: .height20)
    
    private let productLabel = UILabel().then{
        $0.numberOfLines = 1
        $0.textAlignment = .center
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }
    
    private let productStackView = UIStackView().then{
        $0.axis = .vertical
        $0.spacing = 4
        $0.alignment = .center
    }
    
    private let borderLine = ZatchComponent.BorderLine(color: .black5, height: 1)
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(productStackView)
        baseView.addSubview(shareTag)
        baseView.addSubview(borderLine)
        
        productStackView.addArrangedSubview(categoryTag)
        productStackView.addArrangedSubview(productLabel)
    }
    
    override func layout() {
        super.layout()
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
    
    func bindingData(_ zatch: ZatchResponseModel){
        categoryTag.setCategoryTitle(categoryId: zatch.categoryId)
        productLabel.text = zatch.itemName
    }
}
