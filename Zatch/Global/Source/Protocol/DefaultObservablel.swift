//
//  DefaultObservable.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/24.
//

import Foundation
import RxSwift

protocol DefaultObservable{
    var disposeBag: DisposeBag { get }
    func bind()
}

protocol DefaultViewModel{
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
}
