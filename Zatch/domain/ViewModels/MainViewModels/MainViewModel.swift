//
//  MainViewModel.swift
//  Zatch
//
//  Created by gomin on 2022/09/07.
//

import Foundation

class MainViewModel {
    
    var heartState: Observable<UIControl.State?> = Observable(nil)
    
    init() {
        
    }
    func heartButtonDidTap(_ state: UIControl.State) {
        print("받은 상태:", state)
        // TODO: API 연결해서 로직 짜야함
        // 왜 state.rawValue가 값이 다른 지...
        switch state.rawValue {
        case 1:
            heartState.value = .selected
            print("빈하트->채운하트:", heartState.value)
        case 5:
            heartState.value = .normal
            print("채운하트->빈하트:", heartState.value)
        default:
            heartState.value = .selected
            print("디폴트 상태:", heartState.value)
        }
        
    }
}
