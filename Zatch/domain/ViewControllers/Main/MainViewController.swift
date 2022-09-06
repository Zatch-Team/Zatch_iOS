//
//  MainViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/05.
//

import Foundation

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.tabBarController?.tabBar.tintColor = .zatchPurple
        
        let view = MainView()
        self.view.addSubview(view)
        
        view.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.tintColor = .zatchPurple
    }

}
