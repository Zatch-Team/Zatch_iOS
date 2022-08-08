//
//  WantElseTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/26.
//

import UIKit

class WantElseTableViewCell: UITableViewCell {
    
    let second = UILabel().then{
        $0.text = "2순위"
        $0.textColor = .zatchDeepYellow
        $0.font = UIFont.pretendard(size: 15, family: .Bold)
    }
    let third = UILabel().then{
        $0.text = "3순위"
        $0.textColor = .zatchDeepYellow
        $0.font = UIFont.pretendard(size: 15, family: .Bold)
    }
    
    let secondCategory = UILabel().then{
        $0.text = "생활용품"
        $0.textColor = .black45
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
    }
    
    let thirdCategory = UILabel().then{
        $0.text = "생활용품"
        $0.numberOfLines = 1
        $0.textColor = .black45
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
    }
    
    let secondWantProduct = UILabel().then{
        $0.text = "몰랑이 햄스터"
        $0.numberOfLines = 0
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 14, family: .Bold)
    }
    
    let thirdWantProduct = UILabel().then{
        $0.text = "2022년 고양이 몰랑이"
        $0.numberOfLines = 0
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 14, family: .Bold)
    }
    

    let stackView = UIStackView().then{
        $0.spacing = 12
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
    }
    
    let leftStack = UIStackView().then{
        $0.axis = .vertical
        $0.spacing = 0
        $0.alignment = .center
    }
    
    let rightStack = UIStackView().then{
        $0.axis = .vertical
        $0.spacing = 0
        $0.alignment = .center
    }
    
    let secondView = UIView()
    let thirdView = UIView()
    
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
        
        self.contentView.addSubview(stackView)
        self.contentView.addSubview(borderLine)
        
        self.stackView.addArrangedSubview(secondView)
        self.stackView.addArrangedSubview(thirdView)
        
        self.secondView.addSubview(leftStack)
        self.secondView.addSubview(secondWantProduct)
        
        self.thirdView.addSubview(rightStack)
        self.thirdView.addSubview(thirdWantProduct)
        
        self.leftStack.addArrangedSubview(second)
        self.leftStack.addArrangedSubview(secondCategory)
        
        self.rightStack.addArrangedSubview(third)
        self.rightStack.addArrangedSubview(thirdCategory)
    }
    
    func setUpConstraint(){
        
        stackView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.bottom.trailing.equalToSuperview().offset(-20)
        }
        
        secondView.snp.makeConstraints{ make in
            make.width.equalTo(154)
            make.height.equalTo(34)
        }
        
        thirdView.snp.makeConstraints{ make in
            make.width.equalTo(154)
            make.height.equalTo(34)
        }
        
        leftStack.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        rightStack.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        secondWantProduct.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.leading.equalTo(leftStack.snp.trailing).offset(12)
            make.trailing.equalToSuperview()
        }
        
        thirdWantProduct.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.leading.equalTo(rightStack.snp.trailing).offset(12)
        }
        
        borderLine.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1)
        }
    }


}
