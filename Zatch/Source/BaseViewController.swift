//
//  BaseViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/06.
//

import UIKit

class BaseViewController: UIViewController {

    let navigationView = UIView()
    
    lazy var backBtn = UIButton().then{
        $0.setImage(UIImage(named: "arrow_left"), for: .normal)
        $0.isUserInteractionEnabled = true
        $0.addTarget(self, action: #selector(backBtnDidClicked(_:)), for: .touchUpInside)
    }
    
    let navigationTitle = UILabel().then{
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = .white
        
        //
        self.view.addSubview(navigationView)
        
        navigationView.addSubview(backBtn)
        navigationView.addSubview(navigationTitle)
        
        //
        navigationView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(32)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(56)
        }
        
        backBtn.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        navigationTitle.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(backBtn.snp.trailing).offset(4)
        }
    }
    
    @objc
    func backBtnDidClicked(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }


}
