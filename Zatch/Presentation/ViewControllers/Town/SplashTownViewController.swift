//
//  TownSplashViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/12.
//

import UIKit

class SplashTownViewController: UIViewController {
    
    private let mainView = SplashTownView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        initialize()
    }
    
    private func style(){
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
    }
    
    private func layout(){
        view.addSubview(mainView)
        mainView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func initialize(){
        mainView.moveSettingBtn.addTarget(self, action: #selector(willMoveTownSettingViewController), for: .touchUpInside)
    }
    
    @objc func willMoveTownSettingViewController(){
        navigationController?.pushViewController(MapTownViewController(), animated: true)
    }


}
