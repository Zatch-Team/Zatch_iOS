//
//  ChattingListViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/16.
//

import UIKit

class ChattingListViewController: BaseTabBarViewController {
    
    //MARK: - Properties
    
    //MARK: - UI
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.tabBarController?.tabBar.tintColor = .systemOrange
        
        setInitSetting()
        setUpChildVC()
        
//        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cellWillMoveToOriginalPosition)))
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.tintColor = .systemOrange
    }
    //MARK: - Action
    
    @objc
    func bellBtnDidClicked(){
        print("bell btn clicked")
    }

}
