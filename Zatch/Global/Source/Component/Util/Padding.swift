//
//  Padding.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/11.
//

import Foundation

extension ZatchComponent{
    struct Padding{
        let left: CGFloat
        let right: CGFloat
        let top: CGFloat
        let bottom: CGFloat
    }
}

extension ZatchComponent.Padding{
    var inset: UIEdgeInsets{
        UIEdgeInsets(top: self.top, left: self.left, bottom: self.bottom, right: self.right)
    }
}
