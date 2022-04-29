//
//  UIFont.swift
//  Zatch
//
//  Created by 박지윤 on 2022/04/29.
//

import Foundation
import UIKit

extension UIFont{
    
    enum Family: String {
        case bold, medium, regular
    }
    
    static func roboto(size: CGFloat = 10, family: Family = .regular) -> UIFont {
        return UIFont(name: "pretendard_\(family)", size: size)!
    }
}
