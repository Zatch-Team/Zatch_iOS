//
//  UIFont.swift
//  Zatch
//
//  Created by 박지윤 on 2022/04/29.
//

import Foundation
import UIKit

extension UIFont{
    
    /* 프로젝트 내 적용 가능한 폰트 출력 코드
    for family in UIFont.familyNames {
        print("\(family)");
                    
        for names in UIFont.fontNames(forFamilyName: family) {
            print("== \(names)");
        }
    }
    */
    
    enum Family: String {
        case Bold, Medium, Regular
    }
    
    static func pretendard(size: CGFloat = 14, family: Family = .Medium) -> UIFont! {
        guard let font: UIFont = UIFont(name: "Pretendard-\(family)", size: size) else{
            return nil
        }
        return font
    }
    
    static func rixYeoljeongdo(size: CGFloat) -> UIFont! {
        guard let font: UIFont = UIFont(name: "RixYeoljeongdoPR", size: size) else{
            return nil
        }
        return font
    }
}
