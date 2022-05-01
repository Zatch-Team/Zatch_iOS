//
//  SecondSearchViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/01.
//

import UIKit
import SnapKit

class SecondSearchViewController: UIViewController {
    
    let titleLabel = UILabel()
    let myLabel = UILabel()
    let wantLabel = UILabel()
    let exchangeImage = UIImageView()
    let subTitle1 = UILabel()
    let subTitle2 = UILabel()
    let backButton = UIButton()
    let nextButton = PurpleButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
        setUpValue()
        setUpView()
        setConstraints()
        
        self.backButton.addTarget(self, action: #selector(popToSearchVC(_:)), for: .touchUpInside)
        self.nextButton.addTarget(self, action: #selector(moveToResultVC(_:)), for: .touchUpInside)
    }
    
    //MARK: UIComponent
    
    //내용 설정
    func setUpValue(){
        backButton.setImage(UIImage(named: "arrow_left"), for: .normal)
        
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
        
        subTitle2.text = "내가 찾는 재치"
        subTitle2.textColor = .black85
        subTitle2.font = UIFont.pretendard(size: 15, family: .Bold)
        
        nextButton.setTitle("검색하기", for: .normal)
        
    }
    
    //뷰 구성요소 세팅
    func setUpView(){
        navigationController?.navigationBar.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(myLabel)
        view.addSubview(wantLabel)
        view.addSubview(exchangeImage)
        view.addSubview(subTitle1)
        view.addSubview(subTitle2)
        view.addSubview(nextButton)
    }
    
    //뷰 제약조건 설정
    func setConstraints(){
        
        backButton.snp.makeConstraints{ make in
            make.left.equalToSuperview().offset(20)
            
        }
        
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
        
        subTitle2.snp.makeConstraints{ make in
            make.top.equalTo(subTitle1.snp.bottom).offset(28)
            make.left.equalToSuperview().offset(24)
        }
        
        nextButton.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().offset(-54)
            make.leading.equalToSuperview().offset(74)
            make.trailing.equalToSuperview().offset(-74)
            
        }
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
