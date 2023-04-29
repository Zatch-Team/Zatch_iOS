//
//  LoginViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/11/11.
//

import UIKit
import KakaoSDKUser
import RxSwift

class LoginViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let loginView = LoginView()
    private let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        initialize()
    }
    
    private func layout(){
        view.addSubview(loginView)
        loginView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private func initialize(){
        loginView.kakaoBtn.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.kakaoBtnDidTapped()
            }).disposed(by: disposeBag)
    }
    
    @objc private func kakaoBtnDidTapped(){
        // 카카오톡 설치 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    //TODO: oauthToken 처리
                    self.getUserDataFromKakao()
                }
            }
        }else{
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    //TODO: oauthToken 처리
                    self.getUserDataFromKakao()
                }
            }
        }
    }
    
    private func getUserDataFromKakao(){
        
        UserApi.shared.me() { (user, error) in
            if let error = error {
                print(error)
            }
            else {
                if let user = user {
                    
                    var scopes = [String]()
                    if user.kakaoAccount?.profileNeedsAgreement == true { scopes.append("profile") }
                    if user.kakaoAccount?.emailNeedsAgreement == true { scopes.append("account_email") }
                    if user.kakaoAccount?.birthdayNeedsAgreement == true { scopes.append("birthday") }
                    if user.kakaoAccount?.genderNeedsAgreement == true { scopes.append("gender") }
                    
                    if scopes.count > 0 {
                        print("사용자에게 추가 동의를 받아야 합니다.")
                        
                        //scope 목록을 전달하여 카카오 로그인 요청
                        UserApi.shared.loginWithKakaoAccount(scopes: scopes) { (_, error) in
                            if let error = error {
                                print(error)
                            }else {
                                UserApi.shared.me() { (user, error) in
                                    if let error = error {
                                        print(error)
                                    }
                                    else {
                                        print("me() success.")
                                        self.getUserData(user: user)
                                    }
                                }
                            }
                        }
                    }
                    else {
                        print("사용자의 추가 동의가 필요하지 않습니다.")
                        self.getUserData(user: user)
                    }
                }
            }
        }
    }
    
    private func getUserData(user: User?){
        
        guard let user = user,
              let email = user.kakaoAccount?.email,
              let name = user.kakaoAccount?.profile?.nickname
        else { return }
        
//        print("닉네임",user.kakaoAccount?.email)
//        print("이름",user.kakaoAccount?.profile?.nickname)
//        print("성별",user.kakaoAccount?.gender)
//        print("생일",user.kakaoAccount?.birthday)
        print("사용자의 추가 동의가 필요하지 않습니다.")
        
        bind(name: name, email: email)
    }
    
    private func bind(name: String, email: String){
        
        let input = LoginViewModel.Input(email: email, name: name)
        
        let output = viewModel.transform(input)
        
        output.loginResponse
            .drive(onNext: { [weak self] in
                if let user = $0 {
                    user.isNewUser ? self?.moveTownViewController() : self?.moveMainViewController()
                } else {
                    //showFailAlert
                }
            }).disposed(by: disposeBag)
    }
    
    private func moveTownViewController(){
        navigationController?.pushViewController(TownRegisterMapViewController(), animated: true)
    }
    
    private func moveMainViewController(){
        navigationController?.pushViewController(MainViewController(), animated: true)
    }

}
