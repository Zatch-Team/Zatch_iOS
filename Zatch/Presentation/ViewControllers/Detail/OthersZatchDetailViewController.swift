//
//  OthersZatchDetailViewController.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/14.
//

import Foundation

final class OthersZatchDetailViewController: ZatchDetailViewController{
    
    private let viewModel: ZatchLikeViewModel
    
    init(zatch: ZatchResponseModel){
        self.viewModel = ZatchLikeViewModel()
        super.init(zatch: zatch, writer: .others) //임시
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func etcBtnDidTapped() {
        //기능 없음
    }
    
    override func likeBtnDidTapped() {
        let input = ZatchLikeViewModel.Input(zatchId: zatch.id, heartState: mainView.isLike)
        let output = viewModel.transform(input)
        
        output.heartState
            .subscribe{ [weak self] in
                if let result = $0 {
                    self?.mainView.isLike = result.isLiked
                }
            }.disposed(by: disposeBag)
    }
    
    override func chatBtnDidTapped() {
        navigationController?.pushViewController(ChattingRoomViewController(), animated: true)
    }
}
