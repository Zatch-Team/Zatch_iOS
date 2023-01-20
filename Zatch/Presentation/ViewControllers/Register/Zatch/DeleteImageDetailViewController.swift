//
//  DeleteImageDetailViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/15.
//

import UIKit

class DeleteImageDetailViewController: RegisterImageDetailViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        super.okBtn.setTitle("삭제", for: .normal)
    }
    
    override func okBtnDidClicked(){
        
        let alert = Alert.ImageDelete.generateAlert().show(in: self)
        
        alert.confirmHandler = {
            super.okBtnDidClicked()
        }
    }
}
