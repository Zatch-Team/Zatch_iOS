//
//  BaseLeftTitleViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/16.
//

import UIKit

class BaseLeftTitleViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func hierarchy() {
        
        super.hierarchy()
        
        navigationView.addSubview(navigationTitle)
    }
    
    override func layout() {
        
        super.layout()
        
        navigationTitle.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(backBtn.snp.trailing).offset(4)
        }
    }
    
}
