//
//  QnAViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/27.
//

import UIKit

class QnAViewController: BaseCenterTitleViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
//        super.navigationTitle.text = "1:1 문의"
        
        let qnaVC = QnATabmanViewController()
        self.addChild(qnaVC)
        self.view.addSubview(qnaVC.view)
        qnaVC.view.snp.makeConstraints { make in
            make.top.equalTo(self.headerView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        self.view.addConstraints(qnaVC.view.constraints)
        qnaVC.didMove(toParent: self)
    }
}
