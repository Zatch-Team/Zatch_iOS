//
//  RegisterImageDetailView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/28.
//

import Foundation

class ImageDetailView: BaseView{
    
    let imageView = UIImageView().then{
        $0.contentMode = .scaleAspectFit
    }
    
    override func hierarchy() {
        self.addSubview(imageView)
    }
    
    override func layout() {
        imageView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview().offset(5)
        }
    }
}
