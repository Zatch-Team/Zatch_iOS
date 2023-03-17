//
//  StrokeTag.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/17.
//

import Foundation

extension ZatchComponent{
    
    class StrokeTag: ZatchComponent.Tag, Tagable{
        
        var isSelected = true{
            didSet{
                isSelected ? setSelectState() : setUnselectState()
            }
        }
        
        override func initialize() {
            super.initialize()
            setSelectState()
        }
        
        func setSelectState() {
            layer.borderWidth = 1.5
            layer.borderColor = color.selectedColor.cgColor
            textColor = color.selectedColor
        }
        
        func setUnselectState() {
            layer.borderWidth = 1
            layer.borderColor = color.unselectedColor.cgColor
            textColor = color.unselectedColor
        }
    }
}

fileprivate extension ZatchComponent.TagColor{
    
    struct TagColorStyle {
        let backgroundColor: UIColor = .white
        let unselectStateColor: UIColor = .black45
        let selectedStateColor: UIColor
    }
    
    private var colorInfo: TagColorStyle{
        switch self{
        case .purple:
            return TagColorStyle(selectedStateColor: .zatchPurple)
        case .yellow:
            return TagColorStyle(selectedStateColor: .zatchYellow)
        }
    }
    
    var backgroundColor: UIColor{
        colorInfo.backgroundColor
    }
    
    var unselectedColor: UIColor{
        colorInfo.unselectStateColor
    }
    
    var selectedColor: UIColor{
        colorInfo.selectedStateColor
    }
}
