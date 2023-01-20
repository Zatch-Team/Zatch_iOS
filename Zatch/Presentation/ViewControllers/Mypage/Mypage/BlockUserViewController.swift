//
//  BlockUserViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/15.
//

import UIKit

class BlockUserViewController: BaseCenterTitleViewController {
    
    var blockData : [String] = ["1"] {
        didSet{
            mainView.tableView.reloadData()
        }
    }
    
    let mainView = BlockUserView()

    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.navigationTitle.text = "차단된 사용자"
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(108)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    override func initialize(){
        mainView.tableView.separatorStyle = .none
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
    
    @objc func unblockBtnDidClicked(){
        let alert = Alert.UnBlock.generateAlert().show(in: self)
        alert.confirmHandler = {
            print("block 해제")
        }
    }

}

extension BlockUserViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        mainView.emptyView.isHidden = blockData.isEmpty ? false : true
        
        return blockData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BlockUserTableViewCell.cellIdentifier, for: indexPath)
                as? BlockUserTableViewCell else { fatalError() }
        
        cell.unblockBtn.addTarget(self, action: #selector(unblockBtnDidClicked), for: .touchUpInside)
        
        return cell
    }

}
