//
//  MypageSettingTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/12.
//

import UIKit

class MypageSettingTableViewCell: UITableViewCell {

    // MARK: - LifeCycles
    var mypageSettingTableView: UITableView!
    var preVC : MypageViewController!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpTableView()
        contentView.addSubview(mypageSettingTableView)
        mypageSettingTableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Functions
    func setUpTableView() {
        mypageSettingTableView = UITableView()
        mypageSettingTableView.then{
            $0.delegate = self
            $0.dataSource = self
            
            // autoHeight
            $0.rowHeight = UITableView.automaticDimension
            $0.estimatedRowHeight = UITableView.automaticDimension
            $0.showsVerticalScrollIndicator = false
            $0.separatorStyle = .none
        }
    }
}
// MARK: - Main TableView delegate
extension MypageSettingTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tag = indexPath.row
        let cell = UITableViewCell()
        switch tag {
        case 0:
            cell.textLabel?.text = "공지사항"
        case 1:
            cell.textLabel?.text = "고객센터"
        case 2:
            cell.textLabel?.text = "1:1문의"
        case 3:
            cell.textLabel?.text = "고객센터"
        default:
            cell.textLabel?.text = ""
        }
        cell.textLabel?.font = UIFont.pretendard(size: 15, family: .Regular)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tag = indexPath.row
        switch tag {
//        case 0:
//            let vc = NoticeViewController()
//            self.preVC.navigationController?.pushViewController(vc, animated: true)
//        case 1:
//            let vc = ServiceCenterViewController()
//            self.preVC.navigationController?.pushViewController(vc, animated: true)
//        case 2:
//            let vc = QnAViewController()
//            self.preVC.navigationController?.pushViewController(vc, animated: true)
        default:
            tableView.deselectRow(at: indexPath, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
