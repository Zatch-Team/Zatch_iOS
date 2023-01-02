//
//  UIString.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/13.
//

import Foundation

extension String{
    
    func returnEndCharacter() -> Character{
        return self[self.index(before: self.endIndex)]
    }
}
