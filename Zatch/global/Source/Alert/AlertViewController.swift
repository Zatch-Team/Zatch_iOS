//
//  AlertViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/03.
//

import UIKit

class AlertViewController: UIViewController {
    
    /*
     구조
     1. Alert(okBtn, 기본 layout)
     2. Message(messageLabel 공통) / Picker
     3. Basic, Info, Cancel (버튼 위치, 속성 각각 조절)/ Date, Time
     
     3의 경우 버튼 위치 및 특성은 각각 조절
     */
    
    var confirmHandler : (() -> ())?
    
    lazy var okBtn = UIButton().then{
        $0.setTitle("확인", for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(size: 14, family: .Bold)
        $0.titleLabel?.textAlignment = .center
        $0.addTarget(self, action: #selector(okBtnDidClicked), for: .touchUpInside)
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
        
        setUpInitSetting()
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
    
    func setUpInitSetting(){
        
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissAlertController))
        gesture.delegate = self
        
        self.view.addGestureRecognizer(gesture)
    }
    
    func setUpView(){
        
        self.view.addSubview(containerView)
        
        containerView.addSubview(btnStackView)
        
        btnStackView.addArrangedSubview(okBtn)
    }
    
    func setUpConstraint(){
        
        containerView.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-24)
        }
        
    }
    
    func settingOkBtnPurpleBackground(){
        
        okBtn.setTitleColor(.white, for: .normal)
        okBtn.backgroundColor = .zatchPurple
        okBtn.layer.cornerRadius = 25/2
        okBtn.titleEdgeInsets = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        
        okBtn.snp.makeConstraints{ make in
            make.height.equalTo(25)
            make.width.equalTo(okBtn.titleLabel!.snp.width).offset(32)
        }
    }
    
    func settingOkBtnWhiteBackground(){
        
        okBtn.setTitleColor(.zatchPurple, for: .normal)
        okBtn.backgroundColor = .white
        
        okBtn.snp.makeConstraints{ make in
            make.height.equalTo(okBtn.titleLabel!.snp.height)
            make.width.equalTo(okBtn.titleLabel!.snp.width)
        }
    }
    
    //MARK: - Action
    
    @objc func dismissAlertController(){
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func okBtnDidClicked(){
        self.confirmHandler?()
        self.dismiss(animated: false, completion: nil)
    }

}

extension AlertViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        guard touch.view?.isDescendant(of: self.containerView) == false else { return false }
        
        return true
    }
}

