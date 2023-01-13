//
//  GatchDetailBottomFixView.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/02.
//

import UIKit

class GatchDetailBottomFixView: BaseView {
    
    let borderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    let buttonStackView = UIStackView().then{
        $0.spacing = 14
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    lazy var recruitFinishButton = UIButton().then{
        $0.titleLabel?.textAlignment = .center
        $0.titleLabel?.setTypoStyleWithSingleLine(typoStyle: .bold16)
        $0.layer.cornerRadius = 47/2
    }
    lazy var chattingButton = UIButton().then{
        $0.setTitle("채팅", for: .normal)
        $0.setTitleColor(.black85, for: .normal)
        $0.titleLabel?.textAlignment = .center
        $0.titleLabel?.setTypoStyleWithSingleLine(typoStyle: .bold16)
        $0.layer.cornerRadius = 47/2
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.5
        $0.layer.borderColor = UIColor.black10.cgColor
    }
    
    //MARK: - Override
    
    override func style() {
        self.backgroundColor = .white
        setRecruitFinishButtonActivationStatus()
    }

    override func hierarchy() {
        self.addSubview(borderLine)
        self.addSubview(buttonStackView)
        
        buttonStackView.addArrangedSubview(recruitFinishButton)
        buttonStackView.addArrangedSubview(chattingButton)
    }
    
    override func layout() {
        
        self.snp.makeConstraints{
            $0.height.equalTo(80)
        }
        
        borderLine.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        buttonStackView.snp.makeConstraints{
            $0.top.equalTo(borderLine.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.bottom.equalToSuperview().offset(-21)
            $0.height.equalTo(47)
        }
        
        recruitFinishButton.snp.makeConstraints{
            $0.top.leading.bottom.equalToSuperview()
        }
        
        chattingButton.snp.makeConstraints{
            $0.top.bottom.trailing.equalToSuperview()
        }
    }
    
    //MARK: - Helper
    
    func setRecruitFinishButtonActivationStatus(){
        
        _ = recruitFinishButton.then{
            $0.isEnabled = true
            $0.setTitle("마감하기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .zatchDeepYellow
        }

        buttonStackView.distribution = .fillEqually
        recruitFinishButton.snp.makeConstraints{
            $0.width.equalTo(164)
        }
        chattingButton.snp.makeConstraints{
            $0.width.equalTo(164)
        }
    }
    
    func setRecruitFinishButtonDeactivationStatus(){
        
        _ = recruitFinishButton.then{
            $0.isEnabled = false
            $0.setTitle("마감완료", for: .normal)
            $0.setTitleColor(.black20, for: .normal)
            $0.backgroundColor = .black5
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.black20.cgColor
        }
        
        buttonStackView.distribution = .fillProportionally
        recruitFinishButton.snp.updateConstraints{
            $0.width.equalTo(240)
        }
        chattingButton.snp.updateConstraints{
            $0.width.equalTo(88)
        }
    }


}
