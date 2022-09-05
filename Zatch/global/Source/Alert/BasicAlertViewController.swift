//
//  BasicAlertViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/14.
//

import UIKit

class BasicAlertViewController: AlertViewController {
    
    init(message: String){
        self.messageLabel.text = message
        super.init(nibName: nil, bundle: nil)
    }
    
    //MARK: - UI
    
    let messageLabel = UILabel().then{
        $0.textColor = UIColor(red: 38/255, green: 38/255, blue: 38/255, alpha: 1)
        $0.font = UIFont.pretendard(size: 13, family: .Medium)
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUpView(){
        super.setUpView()
        
        containerView.addSubview(messageLabel)
    }
    
    override func setUpConstraint(){
        super.setUpConstraint()
        
        messageLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().offset(-4)
        }
        
        btnStackView.snp.makeConstraints{ make in
            make.top.equalTo(messageLabel.snp.bottom).offset(10)
        }
    }
}
