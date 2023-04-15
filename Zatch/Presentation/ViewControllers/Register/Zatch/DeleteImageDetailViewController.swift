//
//  DeleteImageDetailViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/15.
//

import UIKit

class DeleteImageDetailViewController: BaseViewController<EtcButtonHeaderView, ImageDetailView> {
    
    private let image: UIImage
    var completion: (() -> Void)!
    
    init(image: UIImage){
        self.image = image
        super.init(headerView: EtcButtonHeaderView(title: "삭제"),
                   mainView: ImageDetailView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize() {
        super.initialize()
        mainView.imageView.image = image
        headerView.etcButton.addTarget(self, action: #selector(deleteButtonDidClicked), for: .touchUpInside)
    }
    
    //MARK: - Action
    @objc func deleteButtonDidClicked(){
        let alert = Alert.ImageDelete.show(in: self)
        alert.completion = {
            self.completion()
        }
    }
}
