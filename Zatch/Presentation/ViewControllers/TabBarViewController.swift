//
//  TabBarViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/06.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // 인스턴스화
        let mainVC = MainViewController()
        let zatchVC = MyZatchViewController()
        let chatVC = ChattingListViewController()
        let profileVC = MypageViewController()
        
        mainVC.tabBarItem.image = UIImage.init(named: "Home")
        zatchVC.tabBarItem.image = UIImage.init(named: "ZatchIcon")
        chatVC.tabBarItem.image = UIImage.init(named: "Chat")
        profileVC.tabBarItem.image = UIImage.init(named: "Profile")
        
       // navigationController의 root view 설정
        let nav1 = UINavigationController(rootViewController: mainVC)
        let nav2 = UINavigationController(rootViewController: zatchVC)
        let nav3 = UINavigationController(rootViewController: chatVC)
        let nav4 = UINavigationController(rootViewController: profileVC)
    
        setViewControllers([nav1, nav2, nav3, nav4], animated: false)
    }
}
