//
//  MapAlertViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/13.
//

import UIKit

class MapAlertViewController: AlertViewController {
    
    //MARK: - Properties
    var townName: String! {
        didSet{
            self.messageLabel.text = "우리 동네가 ‘\(self.townName!)’이 맞나요?"
        }
    }
    
    //MARK: - UI
    
    let characterImage = UIImageView().then{
        $0.image = UIImage(named: "town_alert")
    }
    
    let messageLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = UIColor(red: 38/255, green: 38/255, blue: 38/255, alpha: 1)
        $0.textAlignment = .center
        $0.numberOfLines = 1
    }
    
    let cancelBtn = UIButton().then{
        $0.setTitle("다시 설정", for: .normal)
        $0.setTitleColor(.zatchPurple, for: .normal)
        $0.backgroundColor = .white
        $0.titleLabel?.font = UIFont.pretendard(size: 14, family: .Bold)
        $0.titleLabel?.textAlignment = .center
        $0.addTarget(self, action: #selector(cancelBtnDidClicked), for: .touchUpInside)
    }
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        
        setUpView()
        setUpConstraint()
        
        self.settingOkBtnWhiteBackground()
    }
    
    override func setUpView() {
        
        super.btnStackView.addArrangedSubview(cancelBtn)
        super.setUpView()
        
        self.containerView.addSubview(characterImage)
        self.containerView.addSubview(messageLabel)
    }
    
    override func setUpConstraint() {
        
        super.setUpConstraint()
        
        characterImage.snp.makeConstraints{
            $0.top.equalToSuperview().offset(22.5)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(118)
        }
        
        messageLabel.snp.makeConstraints{
            $0.top.equalTo(characterImage.snp.bottom).offset(13.5)
            $0.leading.equalTo(28)
            $0.centerX.equalToSuperview()
        }
        
        cancelBtn.snp.makeConstraints{ make in
            make.height.equalToSuperview()
            make.width.equalTo(okBtn.titleLabel!.snp.width)
        }
        
        okBtn.snp.updateConstraints{
            $0.height.equalToSuperview()
        }
        
        btnStackView.snp.makeConstraints{
            $0.height.equalTo(32)
            $0.bottom.equalToSuperview().offset(-16)
            $0.top.equalTo(messageLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
    }
    
    override func okBtnDidClicked() {
        
        
        super.okBtnDidClicked()
    }
    
    @objc func cancelBtnDidClicked(){
        self.dismiss(animated: false)
    }
    
    
}
