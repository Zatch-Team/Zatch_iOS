//
//  CancelOkAlertViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/14.
//

import UIKit

class CancelAlertViewController: MessageAlertViewController {

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
    
    override func hierarchy() {
        super.btnStackView.addArrangedSubview(cancelBtn)
        super.hierarchy()
    }
    
    override func layout() {
        
        super.layout()
        
        cancelBtn.snp.makeConstraints{ make in
            make.width.height.equalTo(okBtn)
        }
        
        btnStackView.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    
    @objc
    func cancelBtnDidClicked(){
        self.dismiss(animated: false, completion: nil)
    }

}
