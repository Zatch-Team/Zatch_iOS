//
//  TownMapAlertViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/16.
//

import UIKit

class TownMapAlertViewController: MapAlertViewController {

    //MARK: - Properties
    var townName: String! {
        didSet{
            self.messageLabel.text = "우리 동네가 ‘\(self.townName!)’ 인가요?"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func okBtnDidClicked(){
        
        super.okBtnDidClicked()
    }

    
    
}
