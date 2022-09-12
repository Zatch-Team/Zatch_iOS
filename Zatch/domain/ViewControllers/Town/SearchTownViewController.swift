//
//  TownSearchViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/12.
//

import UIKit

class SearchTownViewController: UIViewController {
    
    let mainView = SearchTownView()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }

}
