//
//  ModifyMeetingSheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/07.
//

import UIKit

class ModifyMeetingSheetViewController: SheetViewController {

    let mainView = ModifyMeetingSheetView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        sheetType = .MakeMeeting
        super.titleLabel.removeFromSuperview()
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-23)
        }
    }
}
