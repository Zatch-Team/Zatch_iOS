//
//  ImageDetailViewController.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/26.
//

import Foundation

@objc protocol ImageDetailViewController{
    var completion: (() -> Void)! { get }
    @objc func imageProcessButtonDidTapped()
}

extension ImageDetailViewController where Self: BaseViewController<EtcButtonHeaderView, ImageDetailView>{
    
    func setLayout(){
        mainView.snp.remakeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        view.bringSubviewToFront(headerView)
    }
    
    func setHeaderViewHiddenState(){
        headerView.isHidden.toggle()
    }
    
    func initializeProcessButton(){
        headerView.etcButton.addTarget(self, action: #selector(imageProcessButtonDidTapped), for: .touchUpInside)
    }
}
