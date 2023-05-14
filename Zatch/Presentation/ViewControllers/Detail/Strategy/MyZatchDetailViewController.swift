//
//  MyZatchDetailViewController.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/14.
//

import Foundation
import RxSwift

class MyZatchDetailViewController: ZatchDetailViewController{
    
    init(zatch: ZatchResponseModel){
        super.init(zatch: zatch, writer: .me)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let deleteAlert = Alert.zatchDelete.getInstance()
    private let viewModel = MyZatchDetailViewModel()
    
    override func bind() {
        let input = MyZatchDetailViewModel.Input(deleteBtnTap: deleteAlert.complete)
        let output = viewModel.transform(input)
        
        output.deleteResponse
            .subscribe{ [weak self] in
                switch $0 {
                case .success:      self?.navigationController?.popViewController(animated: true)
                default:            return
                }
            }.disposed(by: disposeBag)
    }
    
    override func etcBtnDidTapped() {
        deleteAlert.show(in: self)
    }
    
    override func likeBtnDidTapped() {
        //TODO: 관심 목록 이동
    }
    
    override func chatBtnDidTapped() {
        //TODO: 채팅 리스트 이동
    }
    
}
