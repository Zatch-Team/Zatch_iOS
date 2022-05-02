//
//  SearchViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/04/30.
//

import UIKit
import FlexLayout
import SnapKit
import PinLayout

class SearchViewController: UIViewController{
    
    //MARK: UIComponent
    
    let backButton = NavigationBackButton()
    let topView = TopTitleView()
    let selectTextField = UILabel()
    let underLine = UIView()
    let subTitle = UILabel()
    let nextButton = PurpleButton()
    let skipButton = UIButton()
    let flexContainer = UIView()
    
    var currentSelected: SearchVCCheckBox?
    
    let myZatchData: [String] = ["몰랑이 피규어","매일우유 250ml","콜드브루 60ml","예시가 있다면","이렇게 들어가야","해요","아아앙아ㅏ앙아아앙아아"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.setLeftBarButton(backButton, animated: true)
        self.view.backgroundColor = .white
        
        setUpValue()
        setUpView()
        setUpConstraints()
        
    }
    
    func setUpValue(){
        
        backButton.target = self
        backButton.action = #selector(popViewController(_:))
        
        topView.titleText.text = "내가 교환할 재치를\n입력해주세요."
        
        selectTextField.textAlignment = .center
        
        underLine.backgroundColor = .black85
        
        subTitle.text = "나의 재치"
        subTitle.font = UIFont.pretendard(size: 15, family: .Bold)
        
        flexContainer.flex.wrap(.wrap).direction(.row).define { flex in
            
            for i in myZatchData{
                let button = SearchVCCheckBox()
                button.setTitle(i, for: .normal)
                button.addTarget(self, action: #selector(selectItem(_:)), for: .touchUpInside)
                flex.addItem(button).marginEnd(8).marginBottom(12)
            }
        }
        
        nextButton.setTitle("다음으로", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonClick(_:)), for: .touchUpInside)
        
        skipButton.setTitle("건너뛰기", for: .normal)
        skipButton.setTitleColor(.black45, for: .normal)
        skipButton.titleLabel?.font = UIFont.pretendard(size: 12, family: .Medium)
    }
    
    //MARK: Action
    
    @objc
    func selectItem(_ sender: SearchVCCheckBox){
        currentSelected?.isChecked = false
        currentSelected = sender
        selectTextField.text = sender.title(for: .normal)
    }
    
    @objc
    func popViewController(_ sender: NavigationBackButton){
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func nextButtonClick(_ sender: UIButton){
        let nextVC = SecondSearchViewController()
        nextVC.myLabel.text = selectTextField.text
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func setUpView(){
        self.view.addSubview(topView)
        self.view.addSubview(selectTextField)
        self.view.addSubview(underLine)
        self.view.addSubview(subTitle)
        self.view.addSubview(flexContainer)
        self.view.addSubview(nextButton)
        self.view.addSubview(skipButton)
    }
    
    func setUpConstraints(){
        
        self.topView.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        self.selectTextField.snp.makeConstraints{ make in
            make.height.equalTo(44)
            make.top.equalTo(topView.snp.bottom).offset(54)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
        }
        
        self.underLine.snp.makeConstraints{ make in
            make.top.equalTo(selectTextField.snp.bottom).offset(8)
            make.height.equalTo(1.5)
            make.leading.equalTo(selectTextField)
            make.trailing.equalTo(selectTextField)
        }
        
        self.subTitle.snp.makeConstraints{ make in
            make.top.equalTo(underLine.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(20)
        }
        
        self.flexContainer.snp.makeConstraints{ make in
            make.top.equalTo(subTitle.snp.bottom).offset(16)
            make.bottom.equalTo(nextButton.snp.top).offset(-16)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        self.nextButton.snp.makeConstraints{ make in
            make.bottom.equalTo(skipButton.snp.top).offset(-12)
            make.leading.equalToSuperview().offset(74)
            make.trailing.equalToSuperview().offset(-74)
        }
        
        self.skipButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-26)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.flexContainer.pin.layout()
        self.flexContainer.flex.layout()
    }

    
    
}
