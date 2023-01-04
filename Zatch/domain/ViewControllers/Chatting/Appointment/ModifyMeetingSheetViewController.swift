//
//  ModifyMeetingSheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/07.
//

import UIKit

class ModifyMeetingSheetViewController: BaseBottomSheetViewController {

    let mainView = ModifyMeetingSheetView().then{
        $0.registerBtn.addTarget(self, action: #selector(modifyBtnDidClicked), for: .touchUpInside)
    }
    
    init(){
        super.init(type: .makeMeeting)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-23)
        }
    }
    
    @objc func modifyBtnDidClicked(){
        let vc = MakeMeetingSheetViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
