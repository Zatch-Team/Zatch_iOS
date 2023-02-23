//
//  MyPageCellDelegate.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/23.
//

import Foundation

protocol MyPageCellDelegate{
    func willMoveProfileViewController()
    func willMoveMyZatchViewController()
    func willMoveHeartListViewController()
    func willMoveExchangeFinishViewController()
}
