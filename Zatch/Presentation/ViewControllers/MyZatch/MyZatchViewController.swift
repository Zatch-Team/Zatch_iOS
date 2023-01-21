//
//  MyZatchViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/07.
//

import UIKit

class MyZatchViewController: UIViewController {
    let navigationView = UIView()
    lazy var navigationTitle = UILabel().then{
        $0.text = "나의 재치"
        $0.font = UIFont.pretendard(size: 18, family: .Bold)
    }
    lazy var searchButton = UIButton().then{
        $0.setImage(Image.search, for: .normal)
    }
    lazy var notiButton = UIButton().then{
        $0.setImage(Image.bell, for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController!.view.backgroundColor = .white
        self.view.backgroundColor = .white

        setUpView()
        setUpConstraint()
        setUpChildVC()
        
        self.tabBarController?.tabBar.tintColor = .zatchDeepYellow
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.tintColor = .zatchDeepYellow }

    // MARK: - Functions
    func setUpView() {
        self.view.addSubview(navigationView)
        navigationView.addSubview(navigationTitle)
        navigationView.addSubview(searchButton)
        navigationView.addSubview(notiButton)
    }
    func setUpConstraint() {
        navigationView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(44)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(56)
        }
        navigationTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.centerY.equalToSuperview()
        }
        notiButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        searchButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.trailing.equalTo(notiButton.snp.leading).offset(-12)
            make.centerY.equalToSuperview()
        }
    }
    func setUpChildVC() {
        let myzatchVC = MyZatchTabmanViewController()
        self.addChild(myzatchVC)
        self.view.addSubview(myzatchVC.view)
        myzatchVC.view.snp.makeConstraints { make in
            make.top.equalTo(self.navigationView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        self.view.addConstraints(myzatchVC.view.constraints)
        myzatchVC.didMove(toParent: self)
    }
}
