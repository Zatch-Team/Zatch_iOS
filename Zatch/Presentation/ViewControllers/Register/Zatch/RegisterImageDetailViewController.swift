//
//  RegisterImageDetailViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/15.
//

import UIKit

class RegisterImageDetailViewController: BaseViewController<EtcButtonHeaderView, RegisterImageDetailView> {
    
    //MARK: - Properties
    
    var imageDetailHandler: ((Bool) -> ())?
    
    override func initialize() {
        
        super.initialize()
        
        headerView.etcButton.addTarget(self, action: #selector(okBtnDidClicked), for: .touchUpInside)
    }
    
    //MARK: - Action
    @objc func okBtnDidClicked(){
        self.imageDetailHandler!(true)
        self.navigationController?.popViewController(animated: true)
    }

}
