//
//  ProfileViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/07.
//

import UIKit

class MypageViewController: BaseTabBarViewController<TabBarHeaderView> {
    var mypageView: MypageView!
    var isCertified: Bool!      // 인증 전 후

    override func viewDidLoad() {
        super.viewDidLoad()
        isCertified = false     // 임시로 false 처리

        /*
        super.titleLabel.text = "내 정보"
        super.etcBtn.setImage(Image.setting, for: .normal)
        super.etcBtn.addTarget(self, action: #selector(goSettingButtonDidTap), for: .touchUpInside)
        
        mypageView = MypageView()
        self.view.addSubview(mypageView)
        
        mypageView.setUpTableView(dataSourceDelegate: self)
        mypageView.setUpView()
        mypageView.setUpConstraint()
        
        mypageView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(super.titleView.snp.bottom)
        }
         */
        
        self.tabBarController?.tabBar.tintColor = .zatchPurple
    }

    // MARK: - Actions
    @objc func goSettingButtonDidTap() {
        let vc = SettingViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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
            let vc = ProfileViewController(rightButton: "수정")
            vc.isMyProfile = true
            vc.profileUserName = "나"
            self.navigationController?.pushViewController(vc, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
