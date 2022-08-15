//
//  ImageRegisterCollectionViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/13.
//

import UIKit

class ImageRegisterCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "imageRegisterCell"
    
    let backView = UIView()
    
    let imageView = UIImageView().then{
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.backgroundColor = .black10
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.addSubview(backView)
        backView.addSubview(imageView)
        
        backView.snp.makeConstraints{ make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        imageView.snp.makeConstraints{ make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
