//
//  NavigationView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/07/12.
//

import UIKit

class NavigationView: UIView {
    
    var navigationController : UINavigationController!
    
    let backView = UIView().then{
        $0.backgroundColor = .white
    }
    
    lazy var backBtn = UIButton().then{
        $0.setImage(UIImage(named: "arrow_left"), for: .normal)
        $0.isUserInteractionEnabled = true
        $0.addTarget(self, action: #selector(backBtnDidClicked(_:)), for: .touchUpInside)
    }
    
    let navigationTitle = UILabel().then{
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }

    init(frame: CGRect, navigationController: UINavigationController!){
        
        super.init(frame: .zero)
        
        self.backgroundColor = .white
        self.navigationController = navigationController
        
        setUpView()
        setUpConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        self.addSubview(backView)
        
        backView.addSubview(backBtn)
        backView.addSubview(navigationTitle)
    }
    
    func setUpConstraint(){
        
        self.snp.makeConstraints{ make in
            make.height.equalTo(88)
        }
        
        backView.snp.makeConstraints{ make in
            make.leading.trailing.bottom.equalToSuperview()
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
        self.navigationController.popViewController(animated: true)
    }
    
}
