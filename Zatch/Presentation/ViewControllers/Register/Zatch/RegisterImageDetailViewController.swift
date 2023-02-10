//
//  RegisterImageDetailViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/15.
//

import UIKit

class RegisterImageDetailViewController: BaseViewController<EtcButtonHeaderView, ImageDetailView> {
    
    //MARK: - Properties
    
    var completion: (() -> ())!
    private var image: UIImage
    
    init(image: UIImage){
        self.image = image
        super.init(headerView: EtcButtonHeaderView(title: "확인"),
                   mainView: ImageDetailView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func style() {
        super.style()
        mainView.imageView.image = image
    }
    
    override func initialize() {
        super.initialize()
        headerView.etcButton.addTarget(self, action: #selector(okBtnDidClicked), for: .touchUpInside)
    }
    
    //MARK: - Action
    @objc func okBtnDidClicked(){
        self.completion()
        self.navigationController?.popViewController(animated: true)
    }

}
