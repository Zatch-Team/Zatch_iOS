//
//  ChatInputView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/17.
//

import UIKit

class ChatInputView: UIView {
    
    lazy var etcBtn = UIButton().then{
        $0.setImage(UIImage(named: "chat_open"), for: .normal)
        $0.setImage(UIImage(named: "chat_close"), for: .selected)
    }
    
    let chatTextField = UITextView().then{
        $0.font = UIFont.pretendard(size: 14, family: .Regular)
        $0.layer.cornerRadius = 40/2
        $0.layer.borderWidth = 1.5
        $0.layer.borderColor = UIColor.black20.cgColor
        $0.textContainerInset = UIEdgeInsets(top: 10, left: 16, bottom: 20, right: 24)
    }
    
    lazy var sendBtn = UIButton().then{
        $0.setImage(UIImage(named: "send"), for: .disabled)
        $0.setImage(UIImage(named: "send_activate"), for: .normal)
        $0.isEnabled = false 
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
        setUpConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        self.addSubview(etcBtn)
        self.addSubview(chatTextField)
        
        self.addSubview(sendBtn)
    }
    
    func setUpConstraint(){
        
        self.snp.makeConstraints{ make in
            make.height.equalTo(52)
        }
        
        etcBtn.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        chatTextField.snp.makeConstraints{ make in
            make.leading.equalTo(etcBtn.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
        }
        
        sendBtn.snp.makeConstraints{ make in
            make.trailing.equalTo(chatTextField).offset(-10)
            make.width.height.equalTo(24)
            make.centerY.equalTo(chatTextField)
        }
        
    }
    
}
