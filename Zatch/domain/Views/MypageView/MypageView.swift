//
//  MypageView.swift
//  Zatch
//
//  Created by gomin on 2022/09/12.
//

import Foundation
import UIKit

class MypageView: UIView {
    //
   
    
    // MARK: - Functions
    var mypageTableView : UITableView!
    var isCertified: Bool!      // 인증 전 후
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setUpTableView()
        setUpView()
        setUpConstraint()
        
        isCertified = false     // 임시로 false 처리
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Functions
    func setUpTableView() {
        mypageTableView = UITableView()
        mypageTableView.then{
            $0.delegate = self
            $0.dataSource = self
            $0.register(MyInfoTableViewCell.self, forCellReuseIdentifier: "MyInfoTableViewCell")
            $0.register(CertificationBannerTableViewCell.self, forCellReuseIdentifier: "CertificationBannerTableViewCell")
            $0.register(MyZatchStatisticTableViewCell.self, forCellReuseIdentifier: "MyZatchStatisticTableViewCell")
            $0.register(TownSettingTableViewCell.self, forCellReuseIdentifier: "TownSettingTableViewCell")
            $0.register(MypageSettingTableViewCell.self, forCellReuseIdentifier: "MypageSettingTableViewCell")
            
            // autoHeight
            $0.rowHeight = UITableView.automaticDimension
            $0.estimatedRowHeight = UITableView.automaticDimension
            $0.showsVerticalScrollIndicator = false
            $0.separatorStyle = .none
        }
    }
    func setUpView() {
        addSubview(mypageTableView)
    }
    func setUpConstraint() {
        mypageTableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
// MARK: - Main TableView delegate
extension MypageView: UITableViewDelegate, UITableViewDataSource {
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
            cell.selectionStyle = .none
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TownSettingTableViewCell", for: indexPath) as? TownSettingTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MypageSettingTableViewCell", for: indexPath) as? MypageSettingTableViewCell else { return UITableViewCell() }
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
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
