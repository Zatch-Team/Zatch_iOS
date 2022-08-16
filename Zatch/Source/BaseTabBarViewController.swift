//
//  BaseTabBarViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/16.
//

import UIKit

class BaseTabBarViewController: UIViewController {
    
    let titleLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 18, family: .Bold)
        $0.textColor = .black85
    }
    
    let titleView = UIView()
    
    lazy var etcBtn = UIButton()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true

        self.view.addSubview(titleView)
        
        titleView.addSubview(titleLabel)
        titleView.addSubview(etcBtn)
        
        titleView.snp.makeConstraints{ make in
            make.height.equalTo(56)
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(25)
            make.centerY.equalToSuperview()
            make.height.equalTo(24)
        }
        
        etcBtn.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
    }

}
