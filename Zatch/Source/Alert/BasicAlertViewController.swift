//
//  BasicAlertViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/14.
//

import UIKit

class BasicAlertViewController: UIViewController {
    
    let messageLabel = UILabel().then{
        $0.text = "재치 등록을 완료하시겠습니까?"
        $0.textColor = UIColor(red: 38/255, green: 38/255, blue: 38/255, alpha: 1)
        $0.font = UIFont.pretendard(size: 13, family: .Medium)
        $0.textAlignment = .center
    }
    
    let okBtn = UIButton().then{
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(size: 14, family: .Bold)
        $0.titleLabel?.textAlignment = .center
        $0.backgroundColor = .zatchPurple
        $0.layer.cornerRadius = 25/2
        $0.titleEdgeInsets = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
    }
    
    let containerView = UIView().then{
        
        $0.backgroundColor = .white
    
        $0.layer.cornerRadius = 8
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 8
        $0.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        $0.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    }
    
    let btnStackView = UIStackView().then{
        $0.spacing = 40
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        
        setUpView()
        setUpConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // curveEaseOut: 시작은 천천히, 끝날 땐 빠르게
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut) { [weak self] in
            self?.containerView.transform = .identity
            self?.containerView.isHidden = false
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // curveEaseIn: 시작은 빠르게, 끝날 땐 천천히
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn) { [weak self] in
            self?.containerView.transform = .identity
            self?.containerView.isHidden = true
        }
    }
    
    func setUpView(){
        
        self.view.addSubview(containerView)
        
        containerView.addSubview(messageLabel)
        containerView.addSubview(btnStackView)
        
        btnStackView.addArrangedSubview(okBtn)
    }
    
    func setUpConstraint(){
        
        containerView.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        messageLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().offset(-4)
        }
        
        btnStackView.snp.makeConstraints{ make in
            make.top.equalTo(messageLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
        }
        
        okBtn.snp.makeConstraints{ make in
            make.height.equalTo(25)
            make.width.equalTo(okBtn.titleLabel!.snp.width).offset(32)
        }
    }

}
