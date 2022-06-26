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
        case Bold, Medium, Regular
    }
    
    static func pretendard(size: CGFloat = 14, family: Family = .Medium) -> UIFont! {
        guard let font: UIFont = UIFont(name: "Pretendard-\(family)", size: size) else{
            return nil
        }
        return font
    }
}
