//
//  BaseHeaderView.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/21.
//

import Foundation

class BaseHeaderView: BaseView{
    
    let etcButton: EtcButton
    
    init(title: String){
        self.etcButton = EtcButton(title: title)
        super.init(frame: .zero)
    }
    
    init(image: UIImage){
        self.etcButton = EtcButton(image: image)
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hierarchy() {
        self.addSubview(etcButton)
    }
    
    override func layout() {
        self.snp.makeConstraints{
            $0.height.equalTo(60)
        }
        etcButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(etcButton.snp.height)
        }
    }
}
