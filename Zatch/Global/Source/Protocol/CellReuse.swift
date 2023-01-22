//
//  BaseProtocol.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/03.
//

import Foundation

protocol CellReuse{
    static var cellIdentifier: String { get }
}

extension CellReuse{
    static var cellIdentifier: String{
        return String(describing: self)
    }
}
