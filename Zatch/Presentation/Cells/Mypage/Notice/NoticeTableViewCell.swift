//
//  NoticeTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/10/26.
//

import UIKit

class NoticeTableViewCell: BaseTableViewCell {

    private let titleLabel = UILabel().then{
        $0.text = "공지1234"
        $0.numberOfLines = 2
        $0.textColor = .black85
        $0.setTypoStyleWithMultiLine(typoStyle: .medium16)
    }
    private let dateLabel = UILabel().then{
        $0.text = "2022.10.19"
        $0.setTypoStyleWithMultiLine(typoStyle: .medium13_15)
        $0.textColor = .black20
    }
    private let borderLine = ZatchComponent.BorderLine(color: .black5, height: 1)
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(titleLabel)
        baseView.addSubview(dateLabel)
        baseView.addSubview(borderLine)
    }
    
    override func layout() {
        
        super.layout()
        
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalToSuperview().offset(12)
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.bottom.trailing.equalToSuperview().inset(20)
        }
        borderLine.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(4)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    func bindingData(){
        
    }
}
