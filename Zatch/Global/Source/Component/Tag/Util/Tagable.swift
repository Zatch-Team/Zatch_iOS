//
//  Tagable.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/17.
//

import Foundation

protocol Tagable{
    var isSelected: Bool { get set }
    func setSelectState()
    func setUnselectState()
}
