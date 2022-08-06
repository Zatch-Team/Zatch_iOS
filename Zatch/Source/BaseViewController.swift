//
//  BaseViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/06.
//

import UIKit

class BaseViewController: UIViewController {
    
    var navigationView : NavigationView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = .white
        
        navigationView = NavigationView(frame: .zero, navigationController: self.navigationController)
        
        self.view.addSubview(navigationView)
        
        navigationView.snp.makeConstraints{ make in
            make.top.leading.trailing.equalToSuperview()
        }
    }


}
