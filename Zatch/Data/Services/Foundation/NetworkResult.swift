//
//  NetworkResult.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/05.
//

import Foundation

enum NetworkResult<T>{
    typealias Code = String
    typealias Message = String
    case success(T)
    case invalidSuccess(Code, Message)
    case failure(Error?)
}
