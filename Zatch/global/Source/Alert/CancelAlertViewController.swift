//
//  CancelOkAlertViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/14.
//

import UIKit

class CancelAlertViewController: MessageAlertViewController {
    
    //MARK: - Properties
    
    var alertHandler : ((Bool) -> ())!
    
    //MARK: - UI
    
    lazy var cancelBtn = UIButton().then{
        $0.backgroundColor = .white
        $0.setTitle("취소", for: .normal)
        $0.setTitleColor(.zatchPurple, for: .normal)
        $0.titleLabel?.textAlignment = .center
        $0.titleLabel?.font = UIFont.pretendard(size: 14, family: .Bold)
        $0.addTarget(self, action: #selector(cancelBtnDidClicked), for: .touchUpInside)
    }
    
    init(message: String, btnTitle: String? = nil){
        
        super.init(message: message)
        
        if let btnTitle = btnTitle {
            okBtn.setTitle(btnTitle, for: .normal)
        }
        
        settingOkBtnPurpleBackground()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setUpView() {
        super.btnStackView.addArrangedSubview(cancelBtn)
        super.setUpView()
    }
    
    override func setUpConstraint() {
        
        super.setUpConstraint()
        
        cancelBtn.snp.makeConstraints{ make in
            make.width.height.equalTo(okBtn)
        }
        
        btnStackView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(messageLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    override func okBtnDidClicked() {
        self.dismiss(animated: false, completion: {
            self.alertHandler?(true)
        })
    }
    
    
    @objc
    func cancelBtnDidClicked(){
        self.dismiss(animated: false, completion: {
            self.alertHandler?(false)
        })
    }

}
