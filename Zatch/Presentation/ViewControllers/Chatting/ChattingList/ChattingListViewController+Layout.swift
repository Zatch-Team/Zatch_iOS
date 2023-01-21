//
//  ChattingListViewController+Layout.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/16.
//

import UIKit

extension ChattingListViewController{
    
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
