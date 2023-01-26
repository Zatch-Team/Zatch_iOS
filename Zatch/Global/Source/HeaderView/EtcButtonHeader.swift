//
//  EtcButtonHeader.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/26.
//

import Foundation

class EtcButtonHeader: BaseHeaderView, HeaderFirstEtcButton{
    
    var etcButton: EtcButton
    
    init(image: UIImage){
        self.etcButton = EtcButton(image: image)
        super.init(frame: .zero)
    }
    
    
    init(title: String){
        self.etcButton = EtcButton(title: title)
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        setEtcButtonLayout()
    }
}
