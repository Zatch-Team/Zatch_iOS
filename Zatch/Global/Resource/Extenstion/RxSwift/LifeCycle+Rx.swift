//
//  LifeCycle+Rx.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/24.
//

import Foundation
import RxSwift

extension RxSwift.Reactive where Base: UIViewController {
    
    public var viewWillAppear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewWillAppear))
            .map { $0.first as? Bool ?? false }
    }
    
    public var viewWillDisappear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewWillDisappear(_:)))
            .map { $0.first as? Bool ?? false }
    }
    
    public var viewDidDisappear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewDidDisappear(_:)))
            .map { $0.first as? Bool ?? false }
    }
}
