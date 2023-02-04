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
    
    final var disposeBag = DisposeBag()
    
    //MARK: - Generator
    
    init(headerView: T, mainView: P){
        self.headerView = headerView
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        
        super.viewDidLoad()

        style()
        layout()
        initialize()
        bind()
    }
    
    func style() {
        self.view.backgroundColor = .white
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func layout() {
        
        self.view.addSubview(headerView)
        self.view.addSubview(mainView)
        
        headerView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(Const.Offset.headerTop)
            $0.leading.trailing.equalToSuperview()
        }
        
        mainView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(Const.Offset.TOP_OFFSET)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    func initialize() {
        headerView.backButton.addTarget(self, action: #selector(viewControllerWillPop), for: .touchUpInside)
    }
    
    func bind() { }
    
    //MARK: - Action
    
    @objc func viewControllerWillPop(){
        print("not clicked?®")
        self.navigationController?.popViewController(animated: true)
    }
}
