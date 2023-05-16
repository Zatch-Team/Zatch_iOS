//
//  ProductInfoTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/26.
//

import UIKit

final class ProductInfoTableViewCell: BaseTableViewCell, BindingZatch {
    
    //stack
    private let stackView = UIStackView().then{
        $0.spacing = 12
        $0.axis = .vertical
        $0.alignment = .leading
    }
    
    private let buyStack = UIStackView().then{
        $0.spacing = 32
        $0.axis = .horizontal
    }
    
    private let countStack = UIStackView().then{
        $0.spacing = 32
        $0.axis = .horizontal
    }
    
    private let openStack = UIStackView().then{
        $0.spacing = 32
        $0.axis = .horizontal
    }
    
    //title label
    private let buy = UILabel().then{
        $0.text = "구매일자"
        $0.textColor = .black85
        $0.font = UIFont.pretendard(family: .Bold)
    }
    
    private let count = UILabel().then{
        $0.text = "수량"
        $0.textColor = .black85
        $0.font = UIFont.pretendard(family: .Bold)
    }
    
    private let open = UILabel().then{
        $0.text = "개봉상태"
        $0.textColor = .black85
        $0.font = UIFont.pretendard(family: .Bold)
    }
    
    //data label
    private let buyLabel = UILabel().then{
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 14,family: .Medium)
    }
    
    private let countLabel = UILabel().then{
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 14,family: .Medium)
    }
    
    private let openLabel = UILabel().then{
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 14,family: .Medium)
    }
    
    private let borderLine = ZatchComponent.BorderLine(color: .black5, height: 1)

    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(stackView)
        baseView.addSubview(borderLine)
        
        stackView.addArrangedSubview(buyStack)
        stackView.addArrangedSubview(countStack)
        stackView.addArrangedSubview(openStack)
        
        buyStack.addArrangedSubview(buy)
        buyStack.addArrangedSubview(buyLabel)
        
        countStack.addArrangedSubview(count)
        countStack.addArrangedSubview(countLabel)
        
        openStack.addArrangedSubview(open)
        openStack.addArrangedSubview(openLabel)
    }
    
    override func layout(){
        super.layout()
        stackView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalTo(borderLine.snp.top).offset(-24)
        }
        
        borderLine.snp.makeConstraints{ make in
            make.height.equalTo(1)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    func bindingData(_ zatch: ZatchResponseModel){
        buyLabel.text = zatch.purchaseDate
        countLabel.text = zatch.quantity
        openLabel.text = Zatch.OpenState(rawValue: zatch.isOpened)?.title
    }
}
