//
//  LoginViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/11/11.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView().then{
        $0.kakaoBtn.addTarget(self, action: #selector(kakaoBtnDidClicked), for: .touchUpInside)
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.addSubview(loginView)
        
        loginView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
    }
    
    @objc func kakaoBtnDidClicked(){
        
    }

}
