//
//  DeleteImageDetailViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/15.
//

import UIKit

class DeleteImageDetailViewController: BaseViewController<EtcButtonHeaderView, ImageDetailView> {
    
    var completion: (() -> Void)!

    init(){
        super.init(headerView: EtcButtonHeaderView(title: "삭제"),
                   mainView: ImageDetailView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize() {
        super.initialize()
        headerView.etcButton.addTarget(self, action: #selector(deleteButtonDidClicked), for: .touchUpInside)
    }
    
    //MARK: - Action
    @objc func deleteButtonDidClicked(){
        let alert = Alert.ImageDelete.generateAlert().show(in: self)
        alert.completion = {
            self.completion()
        }
    }
}
