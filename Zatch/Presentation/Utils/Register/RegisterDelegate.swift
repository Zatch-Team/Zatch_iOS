//
//  RegisterDelegate.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/11.
//

import Foundation

protocol RegisterFirstInfoDelegate{
    func willShowUnitBottomSheet()
    func changeIsOpenState(_ state: Int)
    func dateNotConfirmed(about type: Register.ProductDate)
}
