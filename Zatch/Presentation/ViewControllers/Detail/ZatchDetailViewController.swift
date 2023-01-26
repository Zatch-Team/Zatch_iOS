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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "imageViewCell", for: indexPath) as? DetailImageTableViewCell else{
                fatalError("Cell Casting Error")
            }
            return cell
        case 1:
            
            //1. exchange
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "firstWantCell", for: indexPath) as? ExchangeDetailTableViewCell else{
//                fatalError("Cell Casting Error")
//            }
            
            //2. share
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ShareDetailTableViewCell.cellIdentifier, for: indexPath) as? ShareDetailTableViewCell else{
                fatalError("Cell Casting Error")
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "productInfoCell", for: indexPath) as? ProductInfoTableViewCell else{
                fatalError("Cell Casting Error")
            }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "moreTextCell", for: indexPath) as? MoreTextTableViewCell else{
                fatalError("Cell Casting Error")
            }
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "similarZatchCell", for: indexPath) as? SimilarZatchTableViewCell else{
                fatalError("Cell Casting Error")
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}
