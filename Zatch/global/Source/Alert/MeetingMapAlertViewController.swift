//
//  MeetingMapAlertViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/16.
//

import UIKit

class MeetingMapAlertViewController: MapAlertViewController {
    
    //MARK: - Properties
    
    var addressName: String! {
        didSet{
            self.messageLabel.text = "약속 장소가 \(self.addressName!) 인가요?"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func okBtnDidClicked(){
        self.registerHandler!()
        super.okBtnDidClicked()
    }
}
