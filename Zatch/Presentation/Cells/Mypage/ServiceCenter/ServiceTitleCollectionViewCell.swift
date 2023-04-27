//
//  ServiceTitleCollectionViewCell.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/26.
//

import Foundation

final class ServiceTitleCollectionViewCell: BaseCollectionViewCell{
    
    var title: String!{
        didSet{
            titleLabel.text = title
        }
    }
    
    var isSelect: Bool = false{
        didSet{
            titleLabel.textColor = isSelect ? UIColor.zatchPurple : .black20
        }
    }
    
    private let titleLabel = UILabel().then{
        $0.textColor = .black20
        $0.setTypoStyleWithSingleLine(typoStyle: .bold16)
        $0.textAlignment = .center
    }
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(titleLabel)
    }
    
    override func layout() {
        super.layout()
        titleLabel.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
        }
    }
}
