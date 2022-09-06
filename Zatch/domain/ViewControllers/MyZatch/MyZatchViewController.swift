//
//  MyZatchViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/07.
//

import UIKit

class MyZatchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel().then{
            $0.text = "My Zatch"
            $0.font = UIFont.pretendard(size: 25, family: .Bold)
        }
        self.view.backgroundColor = .white
        self.view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        self.tabBarController?.tabBar.tintColor = .zatchDeepYellow
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.tintColor = .zatchDeepYellow
    }

}
