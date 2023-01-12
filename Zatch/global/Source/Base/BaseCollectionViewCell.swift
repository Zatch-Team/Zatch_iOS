//
//  BaseCollectionViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/12.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    let baseView = UIView().then{
        $0.backgroundColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        hierarchy()
        layout()
    }
    
    func style() { }
    
    func hierarchy(){
        self.contentView.addSubview(baseView)
    }
    
    func layout(){
        baseView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
