//
//  ChattingListViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/16.
//

import UIKit

class ChattingListViewController: UIViewController {
    
    let titleView = TabBarTitleView().then{
        $0.titleLabel.text = "채팅"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
