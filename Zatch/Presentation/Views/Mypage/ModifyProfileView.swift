//
//  ModifyProfileView.swift
//  Zatch
//
//  Created by gomin on 2022/09/19.
//

import Foundation
import UIKit

class ModifyProfileView: BaseView {

    let userImage = UIImageView().then{
        $0.backgroundColor = .systemGray4
        $0.clipsToBounds = true
        $0.layer.cornerRadius = Const.Constraint.profileImageSize/2
    }
    lazy var cameraButton = UIButton().then{
        $0.setImage(Image.cameraButton, for: .normal)
        // shadow
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.masksToBounds = false
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.shadowRadius = 5
        $0.layer.shadowOpacity = 0.1
    }
    let modifyTextfield = UITextField().then {
        $0.borderStyle = .none
        $0.backgroundColor = .white
        $0.addPadding(left: 8, right: 28)
        $0.placeholder = "닉네임"
        $0.font = UIFont.pretendard(size: 18, family: .Bold)
        $0.textColor = .black85
        $0.setClearButton(with: Image.cancel, mode: .whileEditing)
    }
    let textfieldUnderline = ZatchComponent.BorderLine(color: .black5, height: 1.5)
    
    let message = UILabel().then{
        $0.text = "*닉네임을 변경하면 30일 동안 추가 변경 불가합니다."
        $0.font = UIFont.pretendard(size: 14, family: .Regular)
        $0.numberOfLines = 0
        
        $0.asColor(targetString: "30일 동안 추가 변경 불가", color: .red)
    }
    let latestChangeLabel = UILabel().then{
        $0.text = "최근 변경일: "
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.numberOfLines = 1
    }

    override func hierarchy() {
        
        self.addSubview(userImage)
        self.addSubview(cameraButton)
        self.addSubview(modifyTextfield)
        self.addSubview(message)
        self.addSubview(latestChangeLabel)
        
        modifyTextfield.addSubview(textfieldUnderline)
    }
    
    override func layout() {
        userImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.width.height.equalTo(Const.Constraint.profileImageSize)
            $0.centerX.equalToSuperview()
        }
        cameraButton.snp.makeConstraints {
            $0.width.height.equalTo(32)
            $0.trailing.equalTo(userImage).inset(-1)
            $0.bottom.equalTo(userImage).offset(4)
        }
        modifyTextfield.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.top.equalTo(userImage.snp.bottom).offset(36)
        }
        textfieldUnderline.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        message.snp.makeConstraints {
            $0.top.equalTo(modifyTextfield.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(40)
        }
        latestChangeLabel.snp.makeConstraints {
            $0.top.equalTo(message.snp.bottom).offset(4)
            $0.leading.equalTo(message)
        }
    }
}

