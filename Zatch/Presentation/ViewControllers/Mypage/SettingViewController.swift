//
//  SettingViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/19.
//

import UIKit

protocol AlarmSwitchDelegate{
    func willChangeChattingAlarmState(_ isOn: Bool)
    func willChangeGatchAlarmState(_ isOn: Bool)
}

class SettingViewController: BaseViewController<CenterNavigationHeaderView, SettingView> {
    
    init(){
        super.init(headerView: CenterNavigationHeaderView(title: "설정"), mainView: SettingView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize(){
        super.initialize()
        mainView.tableView.separatorStyle = .none
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
}

extension SettingViewController: AlarmSwitchDelegate{
    
    func willChangeChattingAlarmState(_ isOn: Bool) {
        
    }
    
    func willChangeGatchAlarmState(_ isOn: Bool) {
        
    }
}

extension SettingViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch section {
        case 0:
            return 4
        case 1:
            return 3
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
                return tableView.dequeueReusableCell(for: indexPath, cellType: SettingTitleTableViewCell.self).then{
                    $0.setTitle("알림 설정")
                }
            case 1:
                return tableView.dequeueReusableCell(for: indexPath, cellType: AlarmSettingTableViewCell.self).then{
                    $0.delegate = self
                    $0.setCaseAndSwitchValue(.chatting, isOn: true)
                }
            case 2:
                return tableView.dequeueReusableCell(for: indexPath, cellType: AlarmSettingTableViewCell.self).then{
                    $0.delegate = self
                    $0.setCaseAndSwitchValue(.gatch, isOn: true)
                }
            default:
                break
            }
        case 1:
            switch indexPath.row{
            case 0:
                return tableView.dequeueReusableCell(for: indexPath, cellType: SettingTitleTableViewCell.self).then{
                    $0.setTitle("사용자 설정")
                }
            case 1:
                return tableView.dequeueReusableCell(for: indexPath, cellType: DefaultSettingTableViewCell.self).then{
                    $0.setTitle("차단된 사용자")
                }
            default:
                break
            }
        case 2:
            switch indexPath.row{
            case 0:
                return tableView.dequeueReusableCell(for: indexPath, cellType: SettingTitleTableViewCell.self).then{
                    $0.setTitle("계정")
                }
            case 1:
                return tableView.dequeueReusableCell(for: indexPath, cellType: DefaultSettingTableViewCell.self).then{
                    $0.setTitle("회원 탈퇴")
                }
            case 2:
                return tableView.dequeueReusableCell(for: indexPath, cellType: DefaultSettingTableViewCell.self).then{
                    $0.setTitle("로그아웃")
                }
            default:
                break
            }
        default:
            break
        }
        return tableView.dequeueReusableCell(for: indexPath, cellType: SettingBorderLineTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath{
        case [1,1]:
            let blockVC = BlockUserViewController()
            self.navigationController?.pushViewController(blockVC, animated: true)
        case [2,2]:
            let alert = Alert.Logout.generateAlert().show(in: self)
            alert.completion = {
                print("로그아웃 버튼 클릭")
            }
        default:
            return
        }
    }
}

