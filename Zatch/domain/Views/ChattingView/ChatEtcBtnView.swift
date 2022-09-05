//
//  ChatEtcBtnView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/21.
//

import UIKit

class ChatEtcBtnView: UIView {

    let etcBtnStackView = UIStackView().then{
        $0.spacing = 20
        $0.axis = .horizontal
        $0.alignment = .leading
    }

    let cameraStackView = UIStackView().then{
        $0.spacing = 8
        $0.axis = .vertical
        $0.alignment = .center
    }

    lazy var cameraBtn = UIButton().then{
        $0.setImage(UIImage(named: "chat_camera"), for: .normal)
    }

    let cameraLabel = UILabel().then{
        $0.text = "카메라"
        $0.font = UIFont.pretendard(size: 13, family: .Medium)
    }

    let galleryStackView = UIStackView().then{
        $0.spacing = 8
        $0.axis = .vertical
        $0.alignment = .center
    }

    lazy var galleryBtn = UIButton().then{
        $0.setImage(UIImage(named: "chat_gallery"), for: .normal)
    }
    
    let galleryLabel = UILabel().then{
        $0.text = "갤러리"
        $0.font = UIFont.pretendard(size: 13, family: .Medium)
    }

    let appointmentStackView = UIStackView().then{
        $0.spacing = 8
        $0.axis = .vertical
        $0.alignment = .center
    }

    lazy var appointmentBtn = UIButton().then{
        $0.setImage(UIImage(named: "chat_appointment"), for: .normal)
    }
    
    let appointmentLabel = UILabel().then{
        $0.text = "거래약속"
        $0.font = UIFont.pretendard(size: 13, family: .Medium)
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setUpView()
        setUpConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpView(){
        
        self.addSubview(etcBtnStackView)
        
        etcBtnStackView.addArrangedSubview(cameraStackView)
        etcBtnStackView.addArrangedSubview(galleryStackView)
        etcBtnStackView.addArrangedSubview(appointmentStackView)
        
        cameraStackView.addArrangedSubview(cameraBtn)
        cameraStackView.addArrangedSubview(cameraLabel)
        
        galleryStackView.addArrangedSubview(galleryBtn)
        galleryStackView.addArrangedSubview(galleryLabel)
        
        appointmentStackView.addArrangedSubview(appointmentBtn)
        appointmentStackView.addArrangedSubview(appointmentLabel)
    }

    func setUpConstraint(){
        
        self.snp.makeConstraints{ make in
            make.height.equalTo(116)
        }
        
        etcBtnStackView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(44)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-28)
        }
        
        cameraBtn.snp.makeConstraints{ make in
            make.width.height.equalTo(48)
        }
        
        galleryBtn.snp.makeConstraints{ make in
            make.width.height.equalTo(48)
        }
        
        appointmentBtn.snp.makeConstraints{ make in
            make.width.height.equalTo(48)
        }
    }
}
