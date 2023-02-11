//
//  ZatchRegisterRequestManager.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/05.
//

import Foundation

class ZatchRegisterRequestManager{
    
    static let shared = ZatchRegisterRequestManager()
    
    var categoryId: Int = -1
    var productName: String = ""
    var images = [UIImage]()
    var buyDate: String = ""
    var endDate: String = ""
    var isOpen: Bool = false
    
    var firstPriorityCategoryId: Int = -1
    var secondPriorityCategoryId: Int = -1
    var thirdPriorityCategoryId: Int = -1
    var firstPriorityProductName: String = ""
    var secondPriorityProductName: String = ""
    var thirdPriorityProductName: String = ""
    var isAnyZatch: Bool = false
    var isShare: Bool = false
    
    func initialize(){
        categoryId = -1
        productName = ""
        images = [UIImage]()
        buyDate = ""
        endDate = ""
        isOpen = false
        
        firstPriorityCategoryId = -1
        secondPriorityCategoryId = -1
        thirdPriorityCategoryId = -1
        firstPriorityProductName = ""
        secondPriorityProductName = ""
        thirdPriorityProductName = ""
        isAnyZatch = false
        isShare = false
    }
}
