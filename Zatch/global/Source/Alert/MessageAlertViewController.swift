//
//  MessageAlertViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/10.
//

import UIKit

class MessageAlertViewController: AlertViewController {
    
    init(message: String){
        self.messageLabel.text = message
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI
    
    let messageLabel = UILabel().then{
        $0.textColor = UIColor(red: 38/255, green: 38/255, blue: 38/255, alpha: 1)
        $0.font = UIFont.pretendard(size: 13, family: .Medium)
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUpView()
        setUpConstraint()
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
    }
}
