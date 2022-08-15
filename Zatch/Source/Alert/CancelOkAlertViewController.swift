//
//  CancelOkAlertViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/14.
//

import UIKit

class CancelOkAlertViewController: BasicAlertViewController {
    
    //MARK: - Properties
    
    var alertHandler : ((Bool) -> ())?
    
    //MARK: - UI
    
    let cancelBtn = UIButton().then{
        $0.backgroundColor = .white
        $0.setTitle("취소", for: .normal)
        $0.setTitleColor(.zatchPurple, for: .normal)
        $0.titleLabel?.textAlignment = .center
        $0.titleLabel?.font = UIFont.pretendard(size: 14, family: .Bold)
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
    }
    
    override func okBtnDidClicked() {
        self.alertHandler!(true)
        super.okBtnDidClicked()
    }

}
