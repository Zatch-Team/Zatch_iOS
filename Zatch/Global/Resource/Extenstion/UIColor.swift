//
//  UIColor.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/24.
//

import Foundation

extension UIColor{
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}
