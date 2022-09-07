//
//  MeetingSheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/07.
//

import UIKit

class MeetingSheetViewController: SheetViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        sheetType = .MakeMeeting
        super.titleLabel.removeFromSuperview()
        
//        setUpView()
//        setUpConstraint()
//        setUpViewProperties()
    }

}
