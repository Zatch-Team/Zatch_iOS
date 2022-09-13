//
//  ProfileViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/07.
//

import UIKit

class MypageViewController: BaseTabBarViewController {
    var mypageView: MypageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        super.titleLabel.text = "내 정보"
        super.etcBtn.setImage(UIImage(named: "setting"), for: .normal)
        
        mypageView = MypageView()
        self.view.addSubview(mypageView)
        mypageView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(super.titleView.snp.bottom)
        }
        
        self.tabBarController?.tabBar.tintColor = .zatchPurple
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.tintColor = .zatchPurple
    }

}
