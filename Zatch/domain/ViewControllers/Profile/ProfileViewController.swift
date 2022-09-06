//
//  ProfileViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/07.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel().then{
            $0.text = "PROFILE"
            $0.font = UIFont.pretendard(size: 25, family: .Bold)
        }
        self.view.backgroundColor = .white
        self.view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        self.tabBarController?.tabBar.tintColor = .zatchPurple
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.tintColor = .zatchPurple
    }

}
