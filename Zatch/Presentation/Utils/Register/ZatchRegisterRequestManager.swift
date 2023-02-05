//
//  ZatchRegisterRequestManager.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/05.
//

import Foundation

class ZatchRegisterRequestManager{
    
    static let shared = ZatchRegisterRequestManager()
    
    var category: String = ""
    var productName: String = ""
    var images = [UIImage]()
    var buyDate: String = ""
    var endDate: String = ""
    var isOpen: Bool = false
    
    func initialize(){
        category = ""
        productName = ""
        images = [UIImage]()
        buyDate = ""
        endDate = ""
        isOpen = false
    }
}
