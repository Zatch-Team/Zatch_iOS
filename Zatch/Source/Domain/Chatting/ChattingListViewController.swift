//
//  ChattingListViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/16.
//

import UIKit

class ChattingListViewController: BaseTabBarViewController {
    
    var tableView : UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        setInitSetting()
        setUpView()
        setUpConstraint()
    }
    
    //MARK: - Action
    
    @objc
    func bellBtnDidClicked(){
        print("bell btn clicked")
    }

}

extension ChattingListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return ChattingListTableViewCell()
    }
    
}
