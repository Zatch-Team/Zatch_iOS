//
//  SettingViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/19.
//

import UIKit

class SettingViewController: BaseCenterTitleViewController {
    
    let mainView = SettingView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUpInitSetting()
    }
    
    func setUpInitSetting(){
        navigationTitle.text = "설정"
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.leading.bottom.trailing.equalToSuperview()
        }
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        
    }

}

extension SettingViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch section {
        case 0:
            return 3
        case 1:
            return 2
        case 2:
            return 3
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{

        switch indexPath.section{
        case 0:
            switch indexPath.row{
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTitleTableViewCell.cellIdentifier, for: indexPath) as? SettingTitleTableViewCell else { fatalError() }
                cell.titleLabel.text = "알림 설정"
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: AlarmSettingTableViewCell.cellIdentifier, for: indexPath) as? AlarmSettingTableViewCell else { fatalError() }
                cell.titleLabel.text = "채팅 알림"
                cell.explainLabel.text = "누군가 나에게 채팅을 보낼 경우에 알림을 받습니다."
                return cell
            case 2:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: AlarmSettingTableViewCell.cellIdentifier, for: indexPath) as? AlarmSettingTableViewCell else { fatalError() }
                cell.titleLabel.text = "가치 알림"
                cell.explainLabel.text = "내가 올린 가치에 참여자가 생기거나, 내가 참여한 가치의 참여자가 모두 모였을 경우에 알림을 받습니다."
                return cell
            default:
                break
            }
        case 1:
            if (indexPath.row == 0){
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTitleTableViewCell.cellIdentifier, for: indexPath) as? SettingTitleTableViewCell else { fatalError() }
                cell.titleLabel.text = "사용자 설정"
                return cell
            }else{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: DefaultSettingTableViewCell.cellIdentifier, for: indexPath) as? DefaultSettingTableViewCell else { fatalError() }
                cell.titleLabel.text = "차단된 사용자"
                return cell
            }
        case 2:
            switch indexPath.row{
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTitleTableViewCell.cellIdentifier, for: indexPath) as? SettingTitleTableViewCell else { fatalError() }
                cell.titleLabel.text = "계정"
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: DefaultSettingTableViewCell.cellIdentifier, for: indexPath) as? DefaultSettingTableViewCell else { fatalError() }
                cell.titleLabel.text = "회원 탈퇴"
                return cell
            case 2:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: DefaultSettingTableViewCell.cellIdentifier, for: indexPath) as? DefaultSettingTableViewCell else { fatalError() }
                cell.titleLabel.text = "로그아웃"
                return cell
            default:
                break
            }
        default:
            break
        }
        return BaseTableViewCell()
    }
}
