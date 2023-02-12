//
//  ZatchSearchRequestManager.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/12.
//

import Foundation

class ZatchSearchRequestManager{
    
    static let shared = ZatchSearchRequestManager()
    
    private init() { }
    
    var myZatch: String = ""
    
    func initialize(){
        myZatch = ""
    }
}