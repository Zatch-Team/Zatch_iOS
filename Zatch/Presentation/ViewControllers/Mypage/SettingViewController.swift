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
        
        viewModel.chattingAlarmObservable = mainView.tableView
            .cellForRow(at: [0,1], cellType: AlarmSettingTableViewCell.self)?
            .switchObservable
        
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
        guard let delegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
        delegate.window?.rootViewController = LoginViewController()
    }
}

extension SettingViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch section {
        case 0:     return 4
        case 1:     return 3
        case 2:     return 3
        default:    fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        switch indexPath.section{
        case 0:     return getAlarmSectionTableViewCell(indexPath: indexPath)
        case 1:     return getUserSectionTableViewCell(indexPath: indexPath)
        case 2:     return getAccountSectionTableViewCell(indexPath: indexPath)
        default:    fatalError()
        }
    }
    
    private func getAlarmSectionTableViewCell(indexPath: IndexPath) -> BaseTableViewCell {
        switch indexPath.row{
        case 0:     return getSettingTitleTableViewCell(indexPath: indexPath, title: "알림 설정")
        case 1:     return getAlarmTableViewCell(indexPath: indexPath, type: .chatting)
        case 2:     return getAlarmTableViewCell(indexPath: indexPath, type: .gatch)
        default:    return getBorderLineTableViewCell(indexPath: indexPath)
        }
    }
    
    private func getAlarmTableViewCell(indexPath: IndexPath, type: AlarmSettingTableViewCell.AlarmSettingType) -> BaseTableViewCell{
        mainView.tableView.dequeueReusableCell(for: indexPath, cellType: AlarmSettingTableViewCell.self).then{
            $0.setCaseAndSwitchValue(type, isOn: true)
        }
    }
    
    private func getUserSectionTableViewCell(indexPath: IndexPath) -> BaseTableViewCell {
        switch indexPath.row{
        case 0:     return getSettingTitleTableViewCell(indexPath: indexPath, title: "사용자 설정")
        case 1:     return getDefaultSettingTableViewCell(indexPath: indexPath, title: "차단된 사용자")
        default:    return getBorderLineTableViewCell(indexPath: indexPath)
        }
    }
    
    private func getAccountSectionTableViewCell(indexPath: IndexPath) -> BaseTableViewCell {
        switch indexPath.row{
        case 0:     return getSettingTitleTableViewCell(indexPath: indexPath, title: "계정")
        case 1:     return getDefaultSettingTableViewCell(indexPath: indexPath, title: "회원 탈퇴")
        case 2:     return getDefaultSettingTableViewCell(indexPath: indexPath, title: "로그아웃")
        default:    return getBorderLineTableViewCell(indexPath: indexPath)
        }
    }
    
    private func getSettingTitleTableViewCell(indexPath: IndexPath, title: String) -> BaseTableViewCell{
        mainView.tableView.dequeueReusableCell(for: indexPath, cellType: SettingTitleTableViewCell.self).then{
            $0.setTitle(title)
        }
    }
    
    private func getBorderLineTableViewCell(indexPath: IndexPath) -> BaseTableViewCell{
        mainView.tableView.dequeueReusableCell(for: indexPath, cellType: SettingBorderLineTableViewCell.self)
    }
    
    private func getDefaultSettingTableViewCell(indexPath: IndexPath, title: String) -> BaseTableViewCell{
        mainView.tableView.dequeueReusableCell(for: indexPath, cellType: DefaultSettingTableViewCell.self).then{
            $0.setTitle(title)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath{
        case [1,1]:     moveBlockUserViewController()
        case [2,2]:     showLogoutAlert()
        default:        return
        }
    }
    
    private func moveBlockUserViewController(){
        navigationController?.pushViewController(BlockUserViewController(), animated: true)
    }
    
    private func showLogoutAlert(){
        logoutAlert.show(in: self)
    }
}

