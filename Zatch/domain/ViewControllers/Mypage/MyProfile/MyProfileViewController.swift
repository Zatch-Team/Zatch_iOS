//
//  MyProfileViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/13.
//

import UIKit

class MyProfileViewController: BaseTabBarViewController {
    var profileView: MyProfileView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        
        super.titleLabel.text = "내 프로필"
        super.etcBtn.then{
            var config = UIButton.Configuration.plain()
            var attText = AttributedString.init("수정")
            
            attText.font = UIFont.pretendard(size: 16, family: .Bold)
            attText.foregroundColor = .black85
            config.attributedTitle = attText
            
            $0.configuration = config
        }
        super.etcBtn.addTarget(self, action: #selector(modifyProfileButtonDidTap), for: .touchUpInside)
        
        profileView = MyProfileView()
        self.view.addSubview(profileView)
        
        profileView.setUpTableView(dataSourceDelegate: self)
        profileView.setUpView()
        profileView.setUpConstraint()
        
        profileView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(super.titleView.snp.bottom)
        }
    }

    @objc func modifyProfileButtonDidTap() {
        let modifyVC = ModifyProfileViewController()
        modifyVC.modalPresentationStyle = .fullScreen
        self.present(modifyVC, animated: true, completion: nil)
    }
}
// MARK: - TableView delegate
extension MyProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tag = indexPath.row
        switch tag {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        case 1:
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

