//
//  File.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/05.
//

import Foundation
import UIKit

protocol CellCalledViewController{
    func newCellIsSelected(_ indexPath: IndexPath)
    func newCellIsSelected(_ cell: UICollectionViewCell)
}
