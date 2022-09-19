//
//  ZatchViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/19.
//

import UIKit

class ZatchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel().then{
            $0.text = "Zatch"
        }
        self.view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
    }

}
