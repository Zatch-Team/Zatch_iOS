//
//  TownSplashViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/12.
//

import UIKit

class SplashTownViewController: UIViewController {
    
    let mainView = SplashTownView().then{
        $0.moveSettingBtn.addTarget(self, action: #selector(moveSettingBtnDidClicked), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }

    }
    
    @objc func moveSettingBtnDidClicked(){
        let vc = MapTownViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }


}
