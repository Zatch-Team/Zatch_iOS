//
//  TagStlye.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/11.
//

import Foundation

extension ZatchComponent.Tag{
    
    enum TagColor{
        case purple
        case yellow
    }
    
    enum TagType{
        case height20
    }
}

extension ZatchComponent.Tag.TagColor{
    
    struct TagColorStyle{
        let textColor: UIColor
        let backgroundColor: UIColor
        let selectedTextColor: UIColor = .white
        let selectedBackgroundColor: UIColor
    }
    
    private var colorInfo: TagColorStyle{
        switch self{
        case .purple:
            return TagColorStyle(textColor: .zatchPurple,
                                 backgroundColor: .purple40,
                                 selectedBackgroundColor: .zatchPurple)
        case .yellow:
            return TagColorStyle(textColor: .zatchDeepYellow,
                                 backgroundColor: .yellow40,
                                 selectedBackgroundColor: .zatchDeepYellow)
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
}

extension ZatchComponent.Tag.TagType{
    
    var padding: ZatchComponent.Padding{
        switch self{
        case .height20:      return ZatchComponent.Padding(left: 8, right: 8, top: 0, bottom: 0)
        default:        return ZatchComponent.Padding(left: 0, right: 0, top: 0, bottom: 0)
        }
    }
    
    var font: TypoStyle{
        switch self{
        case .height20:      return .medium12
        default:        return .medium12
        }
    }
    
    var height: CGFloat{
        switch self{
        case .height20:      return 20
        default:        return 20
        }
    }
}
