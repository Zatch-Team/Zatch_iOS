//
//  CategoryUIView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/13.
//

import UIKit

class CategoryUIView: UITableViewCell {
    
    let boundaryLine = UIView()
    let categoryText = UILabel()
    let arrowImage = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUpView()
        setUpConstriant()
        setUpValue()

    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func setUpView(){
        
        self.contentView.addSubview(boundaryLine)
        self.contentView.addSubview(categoryText)
        self.contentView.addSubview(arrowImage)
        
    }
    
    func setUpConstriant(){
        
        self.contentView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(41)
        }
        
        boundaryLine.snp.makeConstraints{ make in
            make.height.equalTo(1)
            make.top.equalTo(self.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        categoryText.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(36)
        }
        
        arrowImage.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalToSuperview().offset(12)
        }
    }
    
    func setUpValue(){
        
        boundaryLine.backgroundColor = .black5
        
        categoryText.text = "카테고리 선택"
        categoryText.font = UIFont.pretendard(family: .Medium)
        
        arrowImage.setImage(UIImage(named: "arrow_down"), for: .normal)
        arrowImage.setImage(UIImage(named: "arrow_up"), for: .selected)
    }

}
