//
//  RegisterCellDelegate.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/10.
//

import Foundation

protocol RegisterCellDelegate{
    func datePickerWillShow(dateType: ProductDetailInputTableViewCell.ProductDate, cell: ProductDateChoiceTableViewCell)
}
