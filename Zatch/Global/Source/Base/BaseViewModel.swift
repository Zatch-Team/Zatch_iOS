//
//  BaseViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/24.
//

import Foundation

protocol BaseViewModel{
    associatedtype Input
    associatedtype Output
    func transform(_ input: Input) -> Output
}
