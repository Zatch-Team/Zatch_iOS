//
//  TabBarViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/06.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setTabBarAppearance()
        setTabBarItems()
    }
    
    private func setTabBarAppearance() {
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().tintColor = .zatchPurple
        UITabBar.appearance().unselectedItemTintColor = .black85
//        UITabBar.appearance().layer.borderColor = UIColor.black5.cgColor
//        UITabBar.appearance().layer.borderWidth = 1
//        UITabBar.appearance().clipsToBounds = true
    }
    
    func setTabBarItems(){
        
        let tabs = [UINavigationController(rootViewController: MainViewController()),
                    UINavigationController(rootViewController: MyZatchViewController()),
                    UINavigationController(rootViewController: ChattingListViewController()),
                    UINavigationController(rootViewController: MypageViewController(headerView: TabBarHeaderView(title: "내 정보" ,
                                                                                                                 etcButton: Image.setting)))]
        
        TabBarItem.allCases.forEach {
            tabs[$0.rawValue].tabBarItem = $0.asTabBarItem()
        }
        
        setViewControllers(tabs, animated: true)
    }
}
