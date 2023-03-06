//
//  EtcButton.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/26.
//

import Foundation

class EtcButton: UIButton{
    
    init(title: String){
        
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        setTitleColor(.black85, for: .normal)
        
        titleLabel?.setTypoStyleWithSingleLine(typoStyle: .bold18)
        titleLabel?.textAlignment = .center
        titleEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 4, right: 0)
    }
    
    init(image: UIImage){
        super.init(frame: .zero)
        self.setImage(image, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
