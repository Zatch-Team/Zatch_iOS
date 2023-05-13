//
//  ZatchExchangeTableViewCell.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/14.
//

import Foundation

final class ZatchExchangeTableViewCell: ZatchTableViewCell, ZatchInformationAttach{
    
    let zatchStackView = UIStackView().then{
        $0.spacing = 4
        $0.axis = .vertical
        $0.alignment = .leading
    }
    let myZatchNameLabel = UILabel().then{
        $0.text = "삼다수 생수 1L"
        $0.font = UIFont.pretendard(size: 17, family: .Bold)
    }
    private let tradeImageView = UIImageView().then{
        $0.image = Image.exchangeVerticalSilver
        $0.snp.makeConstraints{
            $0.width.height.equalTo(20)
        }
    }
    private let otherZatchName = UILabel().then{
        $0.text = "신라면 3봉"
        $0.font = UIFont.pretendard(size: 17, family: .Bold)
    }
    
    func zatchStackViewHierarchy() {
        
        baseView.addSubview(zatchStackView)
        
        zatchStackView.addArrangedSubview(myZatchNameLabel)
        zatchStackView.addArrangedSubview(tradeImageView)
        zatchStackView.addArrangedSubview(otherZatchName)
    }
    
    override func hierarchy() {
        super.hierarchy()
        zatchStackViewHierarchy()
    }
    
    override func layout() {
        super.layout()
        zatchStackViewLayout()
    }
}
