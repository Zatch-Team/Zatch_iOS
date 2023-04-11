//
//  ZatchRepositoryInterface.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/18.
//

import Foundation

protocol ZatchRepositoryInterface {
    func registerZatch()
    func getPopularZatch()
    func getAroundZatch()
    func fetchHeartState()
    func getRegisterZatch()
    func getLookingForZatch()
}

