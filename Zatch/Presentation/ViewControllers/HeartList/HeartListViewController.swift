//
//  HeartListViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/19.
//
import UIKit
import SnapKit

class HeartListViewController: BaseCenterTitleViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationTitle.text = "관심 목록"
        
        let heartVC = HeartListTabmanViewController()
        self.addChild(heartVC)
        self.view.addSubview(heartVC.view)
        heartVC.view.snp.makeConstraints { make in
            make.top.equalTo(self.headerView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        self.view.addConstraints(heartVC.view.constraints)
        heartVC.didMove(toParent: self)
    }
}
