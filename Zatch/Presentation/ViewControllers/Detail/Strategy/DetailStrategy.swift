//
//  DetailStrategy.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/14.
//

import Foundation

protocol DetailStrategy{
    init(vc: UIViewController)
    func etcBtnDidTapped()
    func likeBtnDidTapped()
    func chatBtnDidTapped()
}
