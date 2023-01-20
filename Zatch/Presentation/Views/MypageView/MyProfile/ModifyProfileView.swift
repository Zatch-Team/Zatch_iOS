//
//  ModifyProfileView.swift
//  Zatch
//
//  Created by gomin on 2022/09/19.
//

import Foundation
import UIKit

class ModifyProfileView: UIView {
    // MARK: - Views
    let userImage = UIImageView().then{
        $0.backgroundColor = .systemGray4
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 50
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
        $0.addPadding(left: 28, right: 28)
        $0.placeholder = "닉네임"
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.setClearButton(with: Image.cancel, mode: .whileEditing)
    }
    let textfieldUnderline = UIView().then{
        $0.backgroundColor = .black5
    }
    let message = UILabel().then{
        $0.text = "*닉네임을 변경하면 30일 동안 추가 변경 불가합니다."
        $0.font = UIFont.pretendard(size: 12, family: .Regular)
        $0.numberOfLines = 0
        
        $0.asColor(targetString: "30일 동안 추가 변경 불가", color: .red)
    }
    let latestChangeLabel = UILabel().then{
        $0.text = "최근 변경일: "
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.numberOfLines = 0
    }
    
    // MARK: - Life Cycles
    var viewcontroller: ModifyProfileViewController!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
        setUpConstraint()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Functions
    func setViewController(_ vc: ModifyProfileViewController) {
        self.viewcontroller = vc
    }
    func setUpView() {
        addSubview(userImage)
        addSubview(cameraButton)
        
        addSubview(modifyTextfield)
        modifyTextfield.addSubview(textfieldUnderline)
        
        addSubview(message)
        addSubview(latestChangeLabel)
    }
    func setUpConstraint() {
        userImage.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
        }
        cameraButton.snp.makeConstraints { make in
            make.width.height.equalTo(35)
            make.trailing.equalTo(userImage)
            make.bottom.equalTo(userImage.snp.bottom).offset(4)
        }
        modifyTextfield.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(userImage.snp.bottom).offset(36)
            make.centerX.equalToSuperview()
        }
        textfieldUnderline.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8)
        }
        message.snp.makeConstraints { make in
            make.top.equalTo(modifyTextfield.snp.bottom).offset(4)
            make.leading.trailing.equalTo(modifyTextfield).inset(20)
        }
        latestChangeLabel.snp.makeConstraints { make in
            make.top.equalTo(message.snp.bottom).offset(4)
            make.leading.equalTo(message)
        }
    }
}
