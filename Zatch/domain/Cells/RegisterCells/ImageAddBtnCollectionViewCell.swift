//
//  ImageAddBtnCollectionViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/14.
//

import UIKit

class ImageAddBtnCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "imageAddBtnCell"
    
    let backView = UIView().then{
        $0.layer.borderWidth = 1.5
        $0.layer.borderColor = UIColor.black10.cgColor
        $0.layer.cornerRadius = 8
    }
    
    let addBtnImage = UIImageView().then{
        $0.layer.cornerRadius = 8
        $0.image = UIImage(named: "image_add_button")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.addSubview(backView)
        backView.addSubview(addBtnImage)
        
        backView.snp.makeConstraints{ make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        addBtnImage.snp.makeConstraints{ make in
            make.center.equalToSuperview()
            make.width.height.equalTo(32)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
