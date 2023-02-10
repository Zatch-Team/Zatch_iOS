//
//  ImageRegisterCollectionViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/13.
//

import UIKit

class ImageRegisterCollectionViewCell: BaseCollectionViewCell {

    let imageView = UIImageView().then{
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.backgroundColor = .black10
        $0.contentMode = .scaleAspectFill
    }
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(imageView)
    }
    
    override func layout() {
        super.layout()
        imageView.snp.makeConstraints{ make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}
