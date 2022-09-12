//
//  TownSplashViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/12.
//

import UIKit

class SplashTownViewController: UIViewController {
    
    let mainView = SplashTownView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }

    }


}
