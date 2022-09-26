//
//  MyProfileViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/13.
//

import UIKit

class MyProfileViewController: BaseCenterTitleViewController {
    var profileView: MyProfileView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        
        super.navigationTitle.text = "내 프로필"
        
        profileView = MyProfileView()
        self.view.addSubview(profileView)
        
        profileView.setUpTableView(dataSourceDelegate: self)
        profileView.setUpView()
        profileView.setUpConstraint()
        
        profileView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(super.navigationView.snp.bottom)
        }
    }

    override func rightPositionBtnDidClicked() {
        let vc = ModifyProfileViewController(title: "저장")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - TableView delegate
extension MyProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tag = indexPath.row
        switch tag {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = UITableViewCell()
            setUpCell(cell)
            cell.selectionStyle = .none
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyZatchTableViewCell", for: indexPath) as? MyZatchTableViewCell else { return UITableViewCell() }
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
            return 285 + 8
        case 1:
            return 46
        case 2:
            return 46 + 138
        default:
            return 50
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let tag = indexPath.row
//        switch tag {
//        case 0:
//            tableView.deselectRow(at: indexPath, animated: true)
//        default:
//            tableView.deselectRow(at: indexPath, animated: true)
//        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension MyProfileViewController {
    func setUpCell(_ cell: UITableViewCell) {
        let titleLabel = UILabel().then{
            $0.text = "나의 재치 현황"
            $0.font = UIFont.pretendard(size: 15, family: .Bold)
        }
        let moreButton = UIButton().then{
            var config = UIButton.Configuration.plain()
            var attText = AttributedString.init("더보기")
            
            attText.font = UIFont.pretendard(size: 12, family: .Medium)
            attText.foregroundColor = UIColor.black20
            config.attributedTitle = attText
            
            $0.configuration = config
        }
        
        cell.contentView.addSubview(titleLabel)
        cell.contentView.addSubview(moreButton)
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(20)
        }
        moreButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
}
