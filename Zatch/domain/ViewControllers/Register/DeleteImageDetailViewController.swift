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
        
        let alert = CancelAlertViewController(message: "해당 이미지를 삭제하시겠습니까?")
        
        alert.modalPresentationStyle = .overFullScreen
        alert.confirmHandler = {
            super.okBtnDidClicked()
        }
        
        self.navigationController?.present(alert, animated: false, completion: nil)
    }
}
