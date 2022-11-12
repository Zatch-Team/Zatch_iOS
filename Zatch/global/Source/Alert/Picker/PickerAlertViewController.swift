//
//  PickerAlertViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/02.
//

import UIKit

class PickerAlertViewController: AlertViewController {
    
    //MARK: - Properties

    var pickerHandler : (([Int]) -> ())?
    
    //MARK: - UI

    let titleLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 14, family: .Bold)
        $0.textColor = .black85
    }
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        settingOkBtnPurpleBackground()
    }
    
    override func hierarchy() {
        super.hierarchy()
        self.containerView.addSubview(titleLabel)
    }
    
    override func layout() {
        
        super.layout()
        
        containerView.snp.updateConstraints{ make in
            make.leading.equalToSuperview().offset(24)
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(14)
            make.leading.equalToSuperview().offset(16)
        }
        
        btnStackView.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().offset(-23)
        }
    }
}
