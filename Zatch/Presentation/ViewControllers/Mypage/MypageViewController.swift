//
//  MypageViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/07.
//

import UIKit

class MypageViewController: BaseTabBarViewController<BaseTabBarHeaderView> {
    
    private var isCertified: Bool = true    // 인증 전 후
    private let mainView = MyPageView()
    
    init(){
        super.init(headerView: BaseTabBarHeaderView(title: "내 정보", button: Image.setting))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        super.layout()
        self.view.addSubview(mainView)
        mainView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(Const.Offset.TOP_OFFSET)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    override func initialize(){
        headerView.etcButton.addTarget(self, action: #selector(goSettingButtonDidTap), for: .touchUpInside)
        setTableViewDelegateAndDataSource()
    }
    
    private func setTableViewDelegateAndDataSource(){
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }

    // MARK: - Actions
    @objc func goSettingButtonDidTap() {
        let vc = SettingViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - TableView delegate
extension MypageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 1){
            return 4
        }
        return isCertified ? 1 : 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0){
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: MyInfoTableViewCell.self).then{
                    $0.delegate = self
                }
                if(isCertified){
                    cell.showProfileImageBorderLine()
                    cell.willSectionDividerShow()
                }
                return cell
            case 1:
                return tableView.dequeueReusableCell(for: indexPath, cellType: BannerTableViewCell.self).then{
                    $0.setBannerImage(Image.certificationBanner)
                }
            default:
                break
            }
        }
        
        //section 1인 경우
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCell(for: indexPath, cellType: MyZatchStatisticTableViewCell.self).then{
                $0.delegate = self
                $0.bindingData()
            }
        case 1:
            return tableView.dequeueReusableCell(for: indexPath, cellType: TownSettingTableViewCell.self).then{
                $0.delegate = self
            }
        case 2:
            return tableView.dequeueReusableCell(for: indexPath, cellType: BaseMyPageTableViewCell.self).then{
                $0.setTitle("공지사항")
            }
        case 3:
            return tableView.dequeueReusableCell(for: indexPath, cellType: BaseMyPageTableViewCell.self).then{
                $0.setTitle("고객센터")
            }
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath.section == 1 && indexPath.row == 1){
            //2차 인증 이동
            return
        }
        
        switch indexPath.row {
        case 2:
            self.navigationController?.pushViewController(NoticeViewController(), animated: true)
            return
        case 3:
//            let vc = ServiceCenterViewController()
//            self.navigationController?.pushViewController(vc, animated: true)
            return
        default:
            return
        }
    }
}

extension MypageViewController: MyPageCellDelegate{
    
    func willMoveProfileViewController(){
        self.navigationController?.pushViewController(MyProfileViewController(), animated: true)
    }
    func willMoveMyZatchViewController(){
//        let vc = MyZatchViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    func willMoveHeartListViewController(){
        self.navigationController?.pushViewController(HeartListViewController(), animated: true)
    }
    func willMoveExchangeFinishViewController(){
//        let vc = MyZatchViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func willMoveTownSettingViewController(){
        let vc = SearchTownViewController()
        vc.view.backgroundColor = .white
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
