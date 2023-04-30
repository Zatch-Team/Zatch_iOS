//
//  SettingViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/19.
//

import UIKit
import RxSwift
import RxCocoa

class SettingViewController: BaseViewController<CenterNavigationHeaderView, TableOnlyView> {
    
    init(){
        super.init(
            headerView: CenterNavigationHeaderView(title: "설정"),
            mainView: TableOnlyView()
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let logoutAlert = Alert.Logout.getInstance()
    private let viewModel = SettingViewModel()
    
    override func initialize(){
        super.initialize()
        mainView.tableView.initializeDelegate(self)
        mainView.registerCell(
            cellTypes: [AlarmSettingTableViewCell.self,
                        DefaultSettingTableViewCell.self,
                        SettingTitleTableViewCell.self,
                        SettingBorderLineTableViewCell.self]
        )
    }
    override func bindAfterViewAppear() {
        
        let input = SettingViewModel.Input(
            logoutBtnTap: logoutAlert.okBtn.rx.tap
        )
        let output = viewModel.transform(input)
        
        output.logoutResponse
            .drive(onNext: {
                if $0 == 200 {
                    self.moveLoginViewController()
                }
            }).disposed(by: disposeBag)
    }
    
    private func moveLoginViewController(){
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        guard let delegate = sceneDelegate else {
            return
        }
        delegate.window?.rootViewController = LoginViewController()
    }
}

extension SettingViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch section {
        case 0:     return 4
        case 1:     return 3
        case 2:     return 3
        default:    return 0
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
                    viewModel.chattingAlarmObservable = $0.switchObservable
                    $0.setCaseAndSwitchValue(.chatting, isOn: true)
                }
            case 2:
                return tableView.dequeueReusableCell(for: indexPath, cellType: AlarmSettingTableViewCell.self).then{
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
            navigationController?.pushViewController(BlockUserViewController(), animated: true)
        case [2,2]:
            logoutAlert.show(in: self)
        default:
            return
        }
    }
}

