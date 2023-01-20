//
//  GatchViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/19.
//

import UIKit

class GatchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel().then{
            $0.text = "Gatch"
        }
        self.view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
    }
    
}
