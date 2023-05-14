//
//  CenterNavigationEtcButtonHeaderView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/24.
//

import Foundation

class CenterNavigationEtcButtonHeaderView: CenterNavigationHeaderView, HeaderFirstEtcButton{
    
    let etcButton: EtcButton
    
    init(title: String, etcButton text: String){
        self.etcButton = EtcButton(title: text)
        super.init(title: title)
    }
    
    init(title: String, etcButton image: UIImage){
        self.etcButton = EtcButton(image: image)
        super.init(title: title)
    }
    
    required init(title: String) {
        fatalError("init(title:) has not been implemented")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        super.layout()
        setEtcButtonLayout()
    }
}
