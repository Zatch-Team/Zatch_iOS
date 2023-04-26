//
//  DeleteImageDetailViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/15.
//

import UIKit

class DeleteImageDetailViewController: BaseViewController<EtcButtonHeaderView, ImageDetailView>, ImageDetailViewController {
    
    var completion: (() -> Void)!
    
    init(image: UIImage){
        super.init(headerView: EtcButtonHeaderView(title: "삭제"),
                   mainView: ImageDetailView())
        mainView.imageView.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        super.layout()
        setLayout()
    }
    
    override func initialize() {
        super.initialize()
        initializeProcessButton()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        setHeaderViewHiddenState()
    }
    
    @objc func imageProcessButtonDidTapped(){
        let alert = Alert.ImageDelete.show(in: self)
        alert.completion = {
            self.completion()
            self.viewControllerWillPop()
        }
    }
}
