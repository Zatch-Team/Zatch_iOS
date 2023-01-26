//
//  DetailViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/26.
//

import UIKit

class ZatchDetailViewController: BaseViewController<BaseHeaderView, ZatchDetailView> {
    
    init() {
        super.init(headerView: BaseHeaderView(), mainView: ZatchDetailView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        
        super.layout()
    
        self.view.bringSubviewToFront(self.headerView)
        mainView.snp.updateConstraints{
            $0.top.equalToSuperview()
        }
    }
    
    override func initialize(){
        mainView.tableView.separatorStyle = .none
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }

}

extension ZatchDetailViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: DetailImageTableViewCell.self)
            return cell
        case 1:
            
            //1. exchange
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "firstWantCell", for: indexPath) as? ExchangeDetailTableViewCell else{
//                fatalError("Cell Casting Error")
//            }
            
            //2. share
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ShareDetailTableViewCell.self)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ProductInfoTableViewCell.self)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: MoreTextTableViewCell.self)
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SimilarZatchTableViewCell.self)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}
