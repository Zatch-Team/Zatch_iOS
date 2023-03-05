//
//  ZatchButton.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/11.
//

import Foundation

extension ZatchComponent{
    
    enum ZatchButtonConfiguration{
        case height48
    }
    
    class ZatchButton: UIButton{
        
        var offset: CGFloat{
            config.offset
        }
        
        private let config: ZatchButtonConfiguration
        
        init(title: String, configuration: ZatchButtonConfiguration){
            self.config = configuration
            super.init(frame: .zero)
            self.setTitle(title, for: .normal)
            initialize()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func initialize(){
            style()
            layout()
        }
        
        private func style(){
            self.layer.cornerRadius = config.height / 2
            self.titleLabel?.setTypoStyleWithSingleLine(typoStyle: config.typo)
        }
        
        private func layout(){
            self.snp.makeConstraints{
                $0.height.equalTo(config.height)
            }
        }
    }
    
}

extension ZatchComponent.ZatchButtonConfiguration{
    
    var height: CGFloat{
        switch self{
        case .height48:     return 48
        }
    }
    
    var typo: TypoStyle{
        switch self{
        case .height48:     return .bold18
        }
    }
    
    var offset: CGFloat{
        switch self{
        case .height48:     return 56
        }
    }
}
