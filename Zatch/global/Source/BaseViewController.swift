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
        $0.addTarget(self, action: #selector(backBtnDidClicked), for: .touchUpInside)
    }
    
    lazy var navigationTitle = UILabel().then{
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = .white
        
        //setUpView
        self.view.addSubview(navigationView)
        
        navigationView.addSubview(backBtn)
        
        //setUpConstraint
        navigationView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(44)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(56)
        }
        
        backBtn.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
    }
    
    @objc
    func backBtnDidClicked(){
        self.navigationController?.popViewController(animated: true)
    }


}
