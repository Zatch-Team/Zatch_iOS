//
//  TagConfiguration.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/17.
//

import Foundation

extension ZatchComponent.TagConfiguration{
    
    var padding: ZatchComponent.Padding{
        switch self{
        case .height20:      return ZatchComponent.Padding(left: 8, right: 8, top: 0, bottom: 0)
        case .height25:      return ZatchComponent.Padding(left: 12, right: 12, top: 2, bottom: 2)
        case .height29:      return ZatchComponent.Padding(left: 10, right: 10, top: 4, bottom: 4)
        case .height31:      return ZatchComponent.Padding(left: 12, right: 12, top: 6, bottom: 6)
        }
    }
    
    var font: TypoStyle{
        switch self{
        case .height20:                 return .medium12
        case .height25, .height29:      return .medium15_21
        case .height31:                 return .medium16
        }
    }
    
    var height: CGFloat{
        switch self{
        case .height20:      return 20
        case .height25:      return 25
        case .height29:      return 29
        case .height31:      return 31
        }
    }
}
