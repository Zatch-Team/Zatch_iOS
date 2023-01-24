//
//  Reactive.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/24.
//

import Foundation

extension Reactive where Base: UIControl {
  public var isSelected: Observable<Bool> {
    self.base.rx.methodInvoked(#selector(setter: self.base.isSelected))
      .compactMap { $0.first as? Bool }
      .startWith(self.base.isSelected)
      .distinctUntilChanged()
      .share()
  }
}
