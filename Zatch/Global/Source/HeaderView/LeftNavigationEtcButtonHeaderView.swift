//
//  LeftNavigationEtcButtonHeaderView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/28.
//

import Foundation

class LeftNavigationEtcButtonHeaderView: LeftNavigationHeaderView, HeaderFirstEtcButton{
    
    let etcButton: EtcButton
    
    init(title: String, etcButton text: String){
        self.etcButton = EtcButton(title: text)
        super.init(title: title)
    }
    
    init(title: String, etcButton image: UIImage){
        self.etcButton = EtcButton(image: image)
        super.init(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(title: String) {
        fatalError("init(title:) has not been implemented")
    }
    
    override func layout() {
        super.layout()
        setEtcButtonLayout()
    }
    
}

