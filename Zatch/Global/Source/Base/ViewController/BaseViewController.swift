//
//  BaseViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/06.
//

import UIKit
import RxSwift

class BaseViewController<T: BaseHeaderView,
                         P: BaseView,
                         L: BaseViewModel>: UIViewController, DefaultObservable {
    
    //MARK: - Properties
    
    let headerView: T
    let mainView: P
    let viewModel: L?
    
    final var disposeBag = DisposeBag()
    
    //MARK: - Generator

    convenience init(headerView: T, mainView: P){
        self.init(headerView: headerView, mainView: mainView, viewModel: nil)
    }
    
    init(headerView: T, mainView: P, viewModel: L?){
        self.headerView = headerView
        self.mainView = mainView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.headerView = BaseHeaderView() as! T
        self.mainView = BaseView() as! P
        self.viewModel = nil
        super.init(coder: coder)
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
        headerView.backButton.addTarget(self, action: #selector(backButtonDidClicked), for: .touchUpInside)
    }
    
    func bind() { }
    
    //MARK: - Action
    
    @objc func backButtonDidClicked(){
        self.navigationController?.popViewController(animated: true)
    }
}
