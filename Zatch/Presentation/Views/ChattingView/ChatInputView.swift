//
//  ChatInputView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/17.
//

import UIKit

extension ChattingRoomView{
    
    class ChatInputView: BaseView {
        
        lazy var etcBtn = UIButton().then{
            $0.setImage(Image.chatOpen, for: .normal)
            $0.setImage(Image.chatClose, for: .selected)
        }
        
        let chatTextField = UITextView().then{
            $0.font = UIFont.pretendard(size: 14, family: .Regular)
            $0.layer.cornerRadius = 44/2
            $0.layer.borderWidth = 1.5
            $0.layer.borderColor = UIColor.black20.cgColor
            $0.textContainerInset = UIEdgeInsets(top: 10, left: 16, bottom: 20, right: 24)
        }
        
        lazy var sendBtn = UIButton().then{
            $0.setImage(Image.send, for: .disabled)
            $0.setImage(Image.sendActivate, for: .normal)
            $0.isEnabled = false
        }
        
        override func hierarchy() {
            addSubview(etcBtn)
            addSubview(chatTextField)
            addSubview(sendBtn)
        }
        
        override func layout() {
            self.snp.makeConstraints{
                $0.height.equalTo(60)
            }
            etcBtn.snp.makeConstraints{
                $0.top.leading.equalToSuperview().offset(16)
                $0.centerY.equalToSuperview()
                $0.width.height.equalTo(28)
            }
            chatTextField.snp.makeConstraints{
                $0.top.bottom.equalToSuperview().inset(8)
                $0.leading.equalTo(etcBtn.snp.trailing).offset(8)
                $0.trailing.equalToSuperview().offset(-16)
                $0.height.equalTo(44)
            }
            sendBtn.snp.makeConstraints{
                $0.top.trailing.bottom.equalTo(chatTextField).inset(8)
                $0.width.height.equalTo(28)
            }
        }
    }
}
