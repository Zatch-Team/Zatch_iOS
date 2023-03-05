//
//  BaseTabBarViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/16.
//

import UIKit
import RxSwift

class BaseTabBarViewController<T: BaseView>: UIViewController, DefaultObservable {

    let headerView: T
    final let disposeBag = DisposeBag()
    
    init(headerView: T){
        self.headerView = headerView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        initialize()
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func style(){
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func layout(){
        self.view.addSubview(headerView)
        headerView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(Const.Offset.headerTop)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func initialize(){ }
    
    func bind() { }
}
