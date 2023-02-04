//
//  ServiceCenterViewController.swift
//  Zatch
//
//  Created by gomin on 2022/10/03.
//

import UIKit

/*
class ServiceCenterViewController: BaseCenterTitleViewController {
    // MARK: - Views
    let searchView = UIView().then{
        $0.backgroundColor = .white
    }
    let searchStack = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 0
    }
    let searchTextField = UITextField().then{
        $0.placeholder = "무엇이 궁금하신가요?"
        $0.font = UIFont.pretendard(size: 16, family: .Medium)
        $0.textColor = .black
        $0.addPadding(left: 8, right: 0)
    }
    let searchButton = UIButton().then{
        $0.setImage(Image.search, for: .normal)
    }
    let textfieldUnderline = UIView().then{
        $0.backgroundColor = .black
    }
    let goQnAButton = Purple36Button(title: "1:1 문의하기")
    
    // MARK: - Life Cycles
    var servicecenterVC: ServiceCenterTabmanViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        super.navigationTitle.text = "고객센터"
        
        setUpView()
        setUpConstraint()
        
        self.searchButton.addTarget(self, action: #selector(searchButtonDidTap), for: .touchUpInside)
        self.goQnAButton.addTarget(self, action: #selector(goQnAButtonDidTap), for: .touchUpInside)
    }

    // MARK: - Actions
    @objc func searchButtonDidTap() {
        servicecenterVC.searchWord = self.searchTextField.text ?? ""
        servicecenterVC.viewDidAppear(true)
    }
    @objc func goQnAButtonDidTap() {
//        let vc = QnAViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    // MARK: - Functions
    func setUpView() {
        self.view.addSubview(searchView)
        searchView.addSubview(searchStack)
        searchStack.addArrangedSubview(searchTextField)
        searchStack.addArrangedSubview(searchButton)
        searchStack.addSubview(textfieldUnderline)
        
        self.view.addSubview(goQnAButton)
        
        servicecenterVC = ServiceCenterTabmanViewController()
        self.addChild(servicecenterVC)
        self.view.addSubview(servicecenterVC.view)
    }
    func setUpConstraint() {
        searchView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(super.headerView.snp.bottom)
            make.height.equalTo(64)
        }
        searchStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.centerY.equalToSuperview()
        }
        searchButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        textfieldUnderline.snp.makeConstraints { make in
            make.height.equalTo(1.5)
            make.leading.trailing.equalTo(searchStack)
            make.top.equalTo(searchStack.snp.bottom).offset(8)
        }
        goQnAButton.snp.makeConstraints { make in
            make.width.equalTo(212)
            make.bottom.equalToSuperview().offset(-94)
            make.centerX.equalToSuperview()
        }
        
        servicecenterVC.view.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(goQnAButton.snp.top)
        }
        self.view.addConstraints(servicecenterVC.view.constraints)
        servicecenterVC.didMove(toParent: self)
    }
}
*/
