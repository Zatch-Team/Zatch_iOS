//
//  MyZatchDetailStrategy.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/14.
//

import Foundation
import RxSwift

class MyZatchDetailStrategy: DetailStrategy{
    
    private let vc: UIViewController
    
    required init(vc: UIViewController){
        self.vc = vc
        bind()
    }
    
    private let deleteAlert = Alert.zatchDelete.getInstance()
    private let viewModel = MyZatchDetailViewModel()
    private let disposeBag = DisposeBag()
    
    func etcBtnDidTapped() {
        deleteAlert.show(in: vc)
    }
    
    func likeBtnDidTapped() {
        //TODO: 관심 목록 이동
    }
    
    func chatBtnDidTapped() {
        //TODO: 채팅 리스트 이동
    }
    
    private func bind(){
        let input = MyZatchDetailViewModel.Input(deleteBtnTap: deleteAlert.complete)
        let output = viewModel.transform(input)
        
        output.deleteResponse
            .subscribe{ [weak self] in
                switch $0 {
                case .success:      self?.vc.navigationController?.popViewController(animated: true)
                default:            return
                }
            }.disposed(by: disposeBag)
    }
}
