//
//  ChattingListViewController+Layout.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/16.
//

import UIKit

extension ChattingListViewController{
    
    func setInitSetting(){
        
        super.titleLabel.text = "채팅"
        
        super.etcBtn.setImage(Image.bell, for: .normal)
        super.etcBtn.addTarget(self, action: #selector(bellBtnDidClicked), for: .touchUpInside)
        
    }
    func setUpChildVC() {
        let vc = ChattingListTabManViewController()
        self.addChild(vc)
        self.view.addSubview(vc.view)
        vc.view.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(88)
            make.leading.trailing.bottom.equalToSuperview()
        }
        self.view.addConstraints(vc.view.constraints)
        vc.didMove(toParent: self)
    }
}
