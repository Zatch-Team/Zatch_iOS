//
//  ProfileViewControllerTest.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/23.
//

import Foundation

protocol ProfileMoreDelegate{
    func willMoveReviewViewController()
    func willMoveMyZatchViewController()
}

class ProfileViewController: BaseViewController<EtcButtonHeaderView,TableOnlyView>{
    
    var userAttachTitle: String?{
        return nil
    }
    
    init(headerView: EtcButtonHeaderView){
        super.init(headerView: headerView, mainView: TableOnlyView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize() {
        
        super.initialize()
        
        mainView.tableView.initializeDelegate(self)
        mainView.registerCell(cellTypes: [ProfileTableViewCell.self,
                                          TitleAndMoreButtonTableViewCell.self,
                                          ZatchTableViewCell.self])
        
        headerView.etcButton.addTarget(self, action: #selector(etcButtonDidTapped), for: .touchUpInside)
    }

    @objc func etcButtonDidTapped() { }
}

extension ProfileViewController: ProfileMoreDelegate{
    
    func willMoveReviewViewController() {
        let vc = ReviewViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func willMoveMyZatchViewController() {
        
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 1 : 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0){
            return tableView.dequeueReusableCell(for: indexPath, cellType: ProfileTableViewCell.self).then{
                $0.delegate = self
                $0.bindingData()
            }
        }
        
        switch indexPath.row{
        case 0:
            return tableView.dequeueReusableCell(for: indexPath, cellType: TitleAndMoreButtonTableViewCell.self).then{
                $0.setTitle(userAttachTitle ?? "")
            }
        case 1:
            return ZatchTableViewCell()
        default:
            return UITableViewCell()
        }
    }
}
