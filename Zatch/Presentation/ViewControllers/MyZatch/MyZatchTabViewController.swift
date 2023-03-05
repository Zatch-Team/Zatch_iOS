//
//  MyZatchViewController.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/28.
//

import UIKit

class MyZatchTabViewController: BaseTabBarViewController<MyZatchTabBarHeaderView> {
    
    private let mainView = MyZatchView()
    
    init(){
        super.init(headerView: MyZatchTabBarHeaderView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        super.layout()
        self.view.addSubview(mainView)
        mainView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(Const.Offset.TOP_OFFSET)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    override func initialize() {
        mainView.floatingButton.addTarget(self, action: #selector(willMoveZatchRegister), for: .touchUpInside)
        
        mainView.zatchTableView.dataSource = self
        mainView.zatchTableView.delegate = self
        mainView.zatchTableView.separatorStyle = .none
    }
    
    @objc func willMoveZatchRegister(){
        let vc = ZatchRegisterFirstViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MyZatchTabViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ZatchTableViewCell.self)
        return cell
    }
    
    
}

