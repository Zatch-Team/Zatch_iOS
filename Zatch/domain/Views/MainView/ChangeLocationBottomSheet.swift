//
//  ChangeLocationBottomSheet.swift
//  Zatch
//
//  Created by gomin on 2022/09/07.
//

import Foundation
import UIKit

class ChangeLocationBottonSheet: SheetViewController {

    var locationTableView: UITableView!
    var viewModel: MainViewModel!
    var mainView: MainView!
    
    var locationData = ["양재동", "서교동", "돈암동"]
    var myLocation: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        super.sheetSize = .LocationChange
        super.titleLabel.text = "내 동네 변경하기"

        locationTableView = UITableView()
        locationTableView.delegate = self
        locationTableView.dataSource = self
        locationTableView.separatorStyle = .none
        
        setUpView()
        if let viewModel = self.viewModel {
            bind()
        }
    }
    func setUpView() {
        self.view.addSubview(locationTableView)
        locationTableView.snp.makeConstraints{ make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(30)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
// MARK: - 동네 변경 TableView delegate
extension ChangeLocationBottonSheet: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = locationData.count ?? 0
        return count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemIdx = indexPath.item
        let cell = UITableViewCell()
        cell.textLabel?.then{
            $0.text = locationData[itemIdx]
            $0.font = UIFont.pretendard(size: 16, family: .Medium)
            $0.textAlignment = .center
            // 현재 location인 Label만 노란색으로 글씨색 설정
            if let myLocation = self.myLocation {
                if myLocation == locationData[itemIdx] {$0.textColor = .zatchDeepYellow}
            } else {
                if itemIdx == 0 {$0.textColor = .zatchDeepYellow}
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idx = indexPath.item
        self.viewModel.locationDidTap(locationData[idx])
        self.mainView.arrowButton.isSelected = false
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
// MARK: - Observable
extension ChangeLocationBottonSheet {
    //MARK: Methods
    private func bind() {
        self.viewModel.myLocation.bind { myLocation in
            print("location changed!", myLocation)
            self.myLocation = myLocation
            if self.myLocation != nil {
                self.mainView.locationLabel.text = self.myLocation
            }
            else {self.mainView.locationLabel.text = "양재동"}
            self.dismiss(animated: true)
        }
    }
}
