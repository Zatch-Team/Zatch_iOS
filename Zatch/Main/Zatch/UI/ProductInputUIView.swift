//
//  ProductInputUIView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/18.
//

import UIKit

class ProductInputUIView: UITableViewCell {
    
    let backView = UIView()
    let boundaryLine = UIView()
    let productName = UITextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpValue()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        self.contentView.addSubview(backView)
        
        backView.addSubview(boundaryLine)
        backView.addSubview(productName)
        
    }
    
    func setUpConstraint(){
        
        self.contentView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(53)
        }
        
        backView.snp.makeConstraints{ make in
            make.height.equalTo(41)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        boundaryLine.snp.makeConstraints{ make in
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        productName.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(36)
            make.centerY.equalToSuperview()
        }
    }
    
    func setUpValue(){
    
        boundaryLine.backgroundColor = .black5
        
        productName.font = UIFont.pretendard(family: .Medium)
        productName.placeholder = "상품 이름을 입력해주세요."
        
    }

}
