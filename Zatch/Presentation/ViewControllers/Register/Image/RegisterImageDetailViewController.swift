//
//  RegisterImageDetailViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/15.
//

import UIKit

class RegisterImageDetailViewController: BaseViewController<EtcButtonHeaderView, ImageDetailView>, ImageDetailViewController {
    
    //MARK: - Properties
    
    var completion: (() -> ())!
    
    init(image: UIImage){
        super.init(headerView: EtcButtonHeaderView(title: "확인"),
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
    
    //MARK: - Action
    @objc func imageProcessButtonDidTapped() {
        completion()
        viewControllerWillPop()
    }

}
