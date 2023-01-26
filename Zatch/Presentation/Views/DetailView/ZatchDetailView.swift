//
//  DetailView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/28.
//

import UIKit

class ZatchDetailView: UIView {
    
    var tableView = UITableView().then{
        $0.contentInset = UIEdgeInsets(top: -48, left: 0, bottom: 0, right: 0)
        $0.showsVerticalScrollIndicator = false
        
        $0.register(DetailImageTableViewCell.self, forCellReuseIdentifier: "imageViewCell")
        $0.register(ExchangeDetailTableViewCell.self, forCellReuseIdentifier: "firstWantCell")
        $0.register(ShareDetailTableViewCell.self, forCellReuseIdentifier: ShareDetailTableViewCell.cellIdentifier)
        $0.register(ProductInfoTableViewCell.self, forCellReuseIdentifier: "productInfoCell")
        $0.register(MoreTextTableViewCell.self, forCellReuseIdentifier: "moreTextCell")
        $0.register(SimilarZatchTableViewCell.self, forCellReuseIdentifier: "similarZatchCell")
    }
    
    let bottomView = BottomFixView()
    
    override init(frame: CGRect){
        super.init(frame: .zero)
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView(){
        self.addSubview(tableView)
        self.addSubview(bottomView)
    }
    
    private func setUpConstraint(){
        
        tableView.snp.makeConstraints{make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(bottomView.snp.top)
        }
        
        bottomView.snp.makeConstraints{ make in
            make.bottom.equalTo(self.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
    }
    

}
