//
//  LocationSearchTextField.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/12.
//

import UIKit

class LocationSearchTextField: UITextField {

    let searchImage = UIImageView().then{
        $0.image = Image.search
        $0.setImageTintColor(.black20)
    }
    
    override init(frame: CGRect){
        
        super.init(frame: frame)
        
        self.placeholder = "이름(동,면,읍)으로 검색"
        self.backgroundColor = .black5
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        self.font = UIFont.pretendard(size: 15, family: .Medium)
        self.addPadding(left: 40, right: 6)
        
        self.addSubview(searchImage)
        
        self.snp.makeConstraints{ make in
            make.height.equalTo(44)
        }
        
        searchImage.snp.makeConstraints{ make in
            make.width.height.equalTo(20)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(12)
        }
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }

}
