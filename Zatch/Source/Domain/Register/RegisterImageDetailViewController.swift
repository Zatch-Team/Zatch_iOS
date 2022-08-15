//
//  RegisterImageDetailViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/15.
//

import UIKit

class RegisterImageDetailViewController: BaseViewController {
    
    //MARK: - Properties
    
    var imageRegisterHandler: ((Bool) -> ())?
    
    //MARK: - UI
    
    lazy var registerBtn = UIButton().then{
        $0.setTitle("확인", for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.setTitleColor(.black85, for: .normal)
        $0.backgroundColor = .white
        $0.addTarget(self, action: #selector(registerBtnDidClicked), for: .touchUpInside)
    }
    
    let imageView = UIImageView().then{
        $0.contentMode = .scaleAspectFit
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.addSubview(registerBtn)
        self.view.addSubview(imageView)
        
        registerBtn.snp.makeConstraints{ make in
            make.height.equalTo(20)
            make.width.equalTo(registerBtn.titleLabel!.snp.width)
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalTo(super.backBtn)
        }
        
        imageView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview().offset(5)
        }
    }
    
    //MARK: - Action
    @objc
    func registerBtnDidClicked(){
        self.imageRegisterHandler!(true)
        self.navigationController?.popViewController(animated: true)
    }

}
