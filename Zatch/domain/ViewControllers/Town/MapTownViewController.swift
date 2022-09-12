//
//  TownMapViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/12.
//

import UIKit

class MapTownViewController: UIViewController {
    
    let mainView = MapTownView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }

}
