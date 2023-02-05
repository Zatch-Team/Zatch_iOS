//
//  UITableView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/19.
//

import Foundation

extension UITableView{
    
    final func register<T: BaseTableViewCell>(cellType: T.Type) {
        self.register(cellType.self, forCellReuseIdentifier: cellType.cellIdentifier)
    }
    
    final func dequeueReusableCell<T: BaseTableViewCell>(for indexPath: IndexPath, cellType: T.Type) -> T { //cellType: T.Type = T.self
        guard let cell = self.dequeueReusableCell(withIdentifier: cellType.cellIdentifier, for: indexPath) as? T else {
          fatalError(
            "Failed to dequeue a cell with identifier \(cellType.cellIdentifier) matching type \(cellType.self). "
              + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
              + "and that you registered the cell beforehand"
          )
        }
        return cell
    }
    
    final func cellForRow<T: BaseTableViewCell>(at indexPath: IndexPath, cellType: T.Type) -> T {
        guard let cell = self.cellForRow(at: indexPath) as? T else { fatalError() }
        return cell
    }
}
