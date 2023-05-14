//
//  BaseViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/06.
//

import UIKit
import RxSwift

class BaseViewController<T: BaseHeaderView,
                         P: BaseView>: UIViewController, DefaultObservable {
    
    //MARK: - Properties
    
    let headerView: T
    let mainView: P
    
    //MARK: - Generator
    
    init(headerView: T, mainView: P){
        self.headerView = headerView
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    final let disposeBag = DisposeBag()
    
    //MARK: - LifeCycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bindAfterViewAppear()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        initialize()
        bind()
    }
    //MARK: - Template Method
    
    func style() {
        view.backgroundColor = .white
        tabBarController?.tabBar.isHidden = true
        navigationController?.isNavigationBarHidden = true
    }
    
    func layout() {
        view.addSubview(headerView)
        view.addSubview(mainView)
        
        headerView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(Const.Offset.headerTop)
            $0.leading.trailing.equalToSuperview()
        }
        mainView.snp.makeConstraints{
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func initialize() {
        headerView.backButton.rx.tap
            .subscribe{ [weak self] _ in
                self?.viewControllerWillPop()
            }.disposed(by: disposeBag)
    }
    
    func bind() { }
    
    func bindAfterViewAppear(){ }
    
    //MARK: - Action
    
    @objc func viewControllerWillPop(){
        navigationController?.popViewController(animated: true)
    }
}
