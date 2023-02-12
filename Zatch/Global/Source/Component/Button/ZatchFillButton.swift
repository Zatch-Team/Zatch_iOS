//
//  ZatchFillButton.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/12.
//

import Foundation

extension ZatchComponent{
    
    class FillButton: ZatchButton{

        enum ButtonColor{
            case purple
            case yellow
        }
        
        private let color: ButtonColor
        
        init(color: ButtonColor, title: String, configuration: ZatchComponent.ZatchButtonConfiguration){
            self.color = color
            super.init(title: title, configuration: configuration)
            initialize()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func initialize(){
            self.backgroundColor = color.backgroundColor
            self.setTitleColor(color.textColor, for: .normal)
        }
    }
}

extension ZatchComponent.FillButton.ButtonColor{
    var backgroundColor: UIColor{
        switch self{
        case .purple:       return .zatchPurple
        case .yellow:       return .zatchDeepYellow
        }
    }
    
    var textColor: UIColor{
        switch self{
        default:    return .white
        }
    }
}
