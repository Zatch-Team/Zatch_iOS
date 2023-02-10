//
//  ImageAddBtnCollectionViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/14.
//

import UIKit

class ImageAddBtnCollectionViewCell: BaseCollectionViewCell {
    
    let backView = UIView().then{
        $0.layer.borderWidth = 1.5
        $0.layer.borderColor = UIColor.black10.cgColor
        $0.layer.cornerRadius = 8
    }
    
    let addBtnImage = UIImageView().then{
        $0.layer.cornerRadius = 8
        $0.image = Image.imageAddButton
    }
    
    override func style() {
        baseView.layer.borderWidth = 1.5
        baseView.layer.borderColor = UIColor.black10.cgColor
        baseView.layer.cornerRadius = 8
    }
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(addBtnImage)
    }
    
    override func layout() {
        super.layout()
        addBtnImage.snp.makeConstraints{ make in
            make.center.equalToSuperview()
            make.width.height.equalTo(32)
        }
    }
}
