//
//  BindingZatch.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/16.
//

import Foundation

protocol BindingZatch where Self: BaseTableViewCell{
    func bindingData(_ zatch: ZatchResponseModel)
}
