//
//  ChattingListViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/16.
//

import UIKit

class ChattingListViewController: BaseTabBarViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        setInitSetting()
        setUpView()
        setUpConstraint()
    }
    
    //MARK: - Action
    
    @objc
    func bellBtnDidClicked(){
        print("bell btn clicked")
    }


}
