//
//  ProfileViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/07.
//

import UIKit

class MypageViewController: BaseTabBarViewController<BaseTabBarHeaderView> {
    
    var isCertified: Bool!      // 인증 전 후
    
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
    
    override func initialize() {
        isCertified = true
        
        headerView.etcButton.addTarget(self, action: #selector(goSettingButtonDidTap), for: .touchUpInside)
        
        setTableViewDelegateAndDataSource()
    }
    
    private func setTableViewDelegateAndDataSource(){
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }

    // MARK: - Actions
    @objc func goSettingButtonDidTap() {
//        let vc = SettingViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func setTownButtonDidTap(sender: UITapGestureRecognizer) {
        let vc = SearchTownViewController()
        vc.view.backgroundColor = .white
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - TableView delegate
extension MypageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tag = indexPath.row
        switch tag {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoTableViewCell", for: indexPath) as? MyInfoTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CertificationBannerTableViewCell", for: indexPath) as? CertificationBannerTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyZatchStatisticTableViewCell", for: indexPath) as? MyZatchStatisticTableViewCell else { return UITableViewCell() }
            cell.preVC = self
            cell.selectionStyle = .none
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TownSettingTableViewCell", for: indexPath) as? TownSettingTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(setTownButtonDidTap(sender:)))
            cell.stack.addGestureRecognizer(tapGesture)
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MypageSettingTableViewCell", for: indexPath) as? MypageSettingTableViewCell else { return UITableViewCell() }
            cell.preVC = self
            cell.selectionStyle = .none
            return cell
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tag = indexPath.row
        switch tag {
        case 0:
            if isCertified {return 232}
            else {return 224}
            return 280
        case 1:
            if isCertified {return 0}
            else {return 56}
        case 2:
            return 161
        case 3:
            return 102
        default:
            return 200
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            // MARK: 내 프로필
//            let vc = ProfileViewController(rightButton: "수정")
//            vc.isMyProfile = true
//            vc.profileUserName = "나"
//            self.navigationController?.pushViewController(vc, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
