//
//  BaseTabBarViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/16.
//

import UIKit

class BaseTabBarViewController: UIViewController {

    let headerView: TabBarHeaderView
    
    init(headerView: TabBarHeaderView){
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
    }
    
    func style(){
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func layout(){
        self.view.addSubview(headerView)
        headerView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(Const.Offset.headerTop)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func initialize(){ }
}
