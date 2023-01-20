//
//  ProductInfoTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/26.
//

import UIKit

class ProductInfoTableViewCell: BaseTableViewCell {
    
    //stack
    let stackView = UIStackView().then{
        $0.spacing = 12
        $0.axis = .vertical
        $0.alignment = .leading
    }
    
    let buyStack = UIStackView().then{
        $0.spacing = 32
        $0.axis = .horizontal
    }
    
    let countStack = UIStackView().then{
        $0.spacing = 32
        $0.axis = .horizontal
    }
    
    let openStack = UIStackView().then{
        $0.spacing = 32
        $0.axis = .horizontal
    }
    
    //title label
    let buy = UILabel().then{
        $0.text = "구매일자"
        $0.textColor = .black85
        $0.font = UIFont.pretendard(family: .Bold)
    }
    
    let count = UILabel().then{
        $0.text = "수량"
        $0.textColor = .black85
        $0.font = UIFont.pretendard(family: .Bold)
    }
    
    let open = UILabel().then{
        $0.text = "개봉상태"
        $0.textColor = .black85
        $0.font = UIFont.pretendard(family: .Bold)
    }
    
    //data label
    let buyLabel = UILabel().then{
        $0.text = "2021/01/28"
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 14,family: .Medium)
    }
    
    let countLabel = UILabel().then{
        $0.text = "12개"
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 14,family: .Medium)
    }
    
    let openLabel = UILabel().then{
        $0.text = "개봉"
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 14,family: .Medium)
    }
    
    let borderLine = UIView().then{
        $0.backgroundColor = .black5
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
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
    
    func setUpConstraint(){
        
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

}
