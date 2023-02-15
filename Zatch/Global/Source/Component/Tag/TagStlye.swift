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
        case height25
        case height31
    }
}

extension ZatchComponent.Tag.TagColor{
    
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

extension ZatchComponent.Tag.TagType{
    
    var padding: ZatchComponent.Padding{
        switch self{
        case .height20:      return ZatchComponent.Padding(left: 8, right: 8, top: 0, bottom: 0)
        case .height25:      return ZatchComponent.Padding(left: 12, right: 12, top: 2, bottom: 2)
        case .height31:      return ZatchComponent.Padding(left: 12, right: 12, top: 6, bottom: 6)
        }
    }
    
    var font: TypoStyle{
        switch self{
        case .height20:      return .medium12
        case .height25:      return .medium15_21
        case .height31:      return .medium16
        }
    }
    
    var height: CGFloat{
        switch self{
        case .height20:      return 20
        case .height25:      return 25
        case .height31:      return 31
        }
    }
}
