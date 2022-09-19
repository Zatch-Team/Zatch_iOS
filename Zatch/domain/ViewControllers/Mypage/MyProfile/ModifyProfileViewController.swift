//
//  ModifyProfileViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/19.
//

import UIKit

class ModifyProfileViewController: BaseCenterTitleViewController {
    var modifyProfileView: ModifyProfileView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationTitle.text = "프로필 편집"
        
        modifyProfileView = ModifyProfileView()
        self.view.addSubview(modifyProfileView)
        
        modifyProfileView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(self.navigationView.snp.bottom)
        }
    }
    
}
