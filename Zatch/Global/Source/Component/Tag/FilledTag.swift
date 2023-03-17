//
//  FilledTag.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/17.
//

import Foundation

extension ZatchComponent{
    
    class FilledTag: ZatchComponent.Tag, Tagable{
        
        var isDisabled = false{
            didSet{
                isDisabled ? setDisabledState() : setUnselectState()
            }
        }
        var isSelected = false{
            didSet{
                isSelected ? setSelectState() : setUnselectState()
            }
        }
        
        override func initialize() {
            super.initialize()
            setUnselectState()
        }
        
        func setSelectState(){
            tag = ViewTag.select
            textColor = color.selectedTextColor
            backgroundColor = color.selectedBackgroundColor
        }
        
        func setUnselectState(){
            tag = ViewTag.normal
            textColor = color.textColor
            backgroundColor = color.backgroundColor
        }
        
        private func setDisabledState(){
            tag = ViewTag.deselect
            textColor = color.disabledTextColor
            backgroundColor = color.disabledBackgroundColor
        }
    }
}

fileprivate extension ZatchComponent.TagColor{
    
    struct TagColorStyle{
        let textColor: UIColor
        let backgroundColor: UIColor
        let selectedTextColor: UIColor = .white
        let selectedBackgroundColor: UIColor
        let disabledTextColor: UIColor
        let disabledBackgroundColor: UIColor
    }
    
    private var colorInfo: TagColorStyle{
        switch self{
        case .purple:
            return TagColorStyle(textColor: .zatchPurple,
                                 backgroundColor: .purple40,
                                 selectedBackgroundColor: .zatchPurple,
                                 disabledTextColor: .black20,
                                 disabledBackgroundColor: .black10)
        case .yellow:
            return TagColorStyle(textColor: .zatchDeepYellow,
                                 backgroundColor: .yellow40,
                                 selectedBackgroundColor: .zatchDeepYellow,
                                 disabledTextColor: .black20,
                                 disabledBackgroundColor: .black10)
        }
    }
    
    var textColor: UIColor{
        colorInfo.textColor
    }
    
    var backgroundColor: UIColor{
        colorInfo.backgroundColor
    }
    
    var selectedTextColor: UIColor{
        colorInfo.selectedTextColor
    }
    
    var selectedBackgroundColor: UIColor{
        colorInfo.selectedBackgroundColor
    }
    
    var disabledTextColor: UIColor{
        colorInfo.disabledTextColor
    }
    
    var disabledBackgroundColor: UIColor{
        colorInfo.disabledBackgroundColor
    }
}
