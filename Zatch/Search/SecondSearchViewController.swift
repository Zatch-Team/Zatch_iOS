//
//  SecondSearchViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/01.
//

import UIKit
import SnapKit
import FlexLayout
import PinLayout

class SecondSearchViewController: UIViewController {
    
    let titleLabel = UILabel()
    let myLabel = UILabel()
    let wantLabel = UILabel()
    let exchangeImage = UIImageView()
    let subTitle1 = UILabel()
    let subTitle2 = UILabel()
    let backButton = NavigationBackButton()
    let nextButton = PurpleButton()
    let flexContainer1 = UIView()
    let flexContainer2 = UIView()
    
    let popularData : [String] = ["몰랑이","몰랑몰랑","몰랑","말랑이","말랭"]
    let findData : [String] = ["몰랑이","몰랑몰랑","몰랑","말랑이","말랭"]
    
    var currentSelected : SearchVCCheckBox?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.navigationItem.hidesBackButton = true

        setUpValue()
        setUpView()
        setConstraints()
    }
    
    //MARK: UIComponent
    
    //내용 설정
    func setUpValue(){
        
        backButton.target = self
        backButton.action = #selector(popToSearchVC(_:))
        self.navigationItem.setLeftBarButton(backButton, animated: true)
        
        titleLabel.text = "무엇을 찾고 있나요?"
        titleLabel.font = UIFont.pretendard(size: 20, family: .Bold)
        
        myLabel.font = UIFont.pretendard(size: 16, family: .Bold)
        myLabel.textColor = .black85
        
        wantLabel.font = UIFont.pretendard(size: 16, family: .Bold)
        wantLabel.textColor = .black85
        
        exchangeImage.image = UIImage(named: "exchange_vertical")
        
        subTitle1.text = "가장 인기있는 재치"
        subTitle1.textColor = .black85
        subTitle1.font = UIFont.pretendard(size: 15, family: .Bold)
        
        flexContainer1.flex.wrap(.wrap).direction(.row).define { flex in
            for i in popularData{
                let button = SearchVCCheckBox()
                button.setTitle(i, for: .normal)
                button.addTarget(self, action: #selector(selectItem(_:)), for: .touchUpInside)
                flex.addItem(button).marginEnd(8).marginBottom(12)
            }
        }
        
        subTitle2.text = "내가 찾는 재치"
        subTitle2.textColor = .black85
        subTitle2.font = UIFont.pretendard(size: 15, family: .Bold)
        
        flexContainer2.flex.wrap(.wrap).direction(.row).define { flex in
            for i in findData{
                let button = SearchVCCheckBox()
                button.setTitle(i, for: .normal)
                button.addTarget(self, action: #selector(selectItem(_:)), for: .touchUpInside)
                flex.addItem(button).marginEnd(8).marginBottom(12)
            }
        }
        
        nextButton.setTitle("검색하기", for: .normal)
        nextButton.addTarget(self, action: #selector(moveToResultVC(_:)), for: .touchUpInside)
        
    }
    
    //뷰 구성요소 세팅
    func setUpView(){
        view.addSubview(titleLabel)
        view.addSubview(myLabel)
        view.addSubview(wantLabel)
        view.addSubview(exchangeImage)
        view.addSubview(subTitle1)
        view.addSubview(flexContainer1)
        view.addSubview(subTitle2)
        view.addSubview(flexContainer2)
        view.addSubview(nextButton)
    }
    
    //뷰 제약조건 설정
    func setConstraints(){
        
        titleLabel.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.left.equalToSuperview().offset(28)
        }
        
        myLabel.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(86)
            make.centerX.equalToSuperview()
        }
        
        exchangeImage.snp.makeConstraints{ make in
            make.top.equalTo(myLabel.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
        
        wantLabel.snp.makeConstraints{ make in
            make.top.equalTo(exchangeImage.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
    
        
        subTitle1.snp.makeConstraints{ make in
            make.top.equalTo(wantLabel.snp.bottom).offset(48)
            make.left.equalToSuperview().offset(24)
        }
        
        flexContainer1.snp.makeConstraints{ make in
            make.top.equalTo(subTitle1.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        subTitle2.snp.makeConstraints{ make in
            make.top.equalTo(flexContainer1.snp.bottom).offset(28)
            make.left.equalToSuperview().offset(24)
        }
        
        flexContainer2.snp.makeConstraints{ make in
            make.top.equalTo(subTitle2.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        nextButton.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().offset(-54)
            make.leading.equalToSuperview().offset(74)
            make.trailing.equalToSuperview().offset(-74)
            make.height.equalTo(38)
        }
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        flexContainer1.pin.layout()
        flexContainer1.flex.layout()
        
        flexContainer2.pin.layout()
        flexContainer2.flex.layout()
    }
    
    //MARK: Action
    @objc
    func popToSearchVC(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func moveToResultVC(_ sender: UIButton){
        let nextVC = SearchResultViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc
    func selectItem(_ sender: SearchVCCheckBox){
        currentSelected?.isChecked = false
        currentSelected = sender
        wantLabel.text = sender.title(for: .normal)
    }

}
