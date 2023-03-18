//
//  ChangeLocationSheetViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/07.
//

import Foundation
import UIKit

class ChangeLocationSheetViewController: BaseBottomSheetViewController<Int> {
    
    private var viewModel: MainViewModel!
    private let locationTableView = UITableView()
    
    init(){
        super.init(type: .locationChange)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize() {
        super.initialize()
        locationTableView.initializeDelegate(self)
    }
    
    override func layout() {
        super.layout()
        view.addSubview(locationTableView)
        locationTableView.snp.makeConstraints{ make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(30)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setViewModel(_ viewModel: MainViewModel){
        self.viewModel = viewModel
        locationTableView.reloadData()
    }
    
}
// MARK: - 동네 변경 TableView delegate
extension ChangeLocationSheetViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.myTowns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemIdx = indexPath.item
        let cell = UITableViewCell()
        cell.backgroundColor = [.red, .blue, .yellow][indexPath.row]
//        cell.textLabel?.then{
//            $0.text = viewModel.myTowns[itemIdx]
//            $0.font = UIFont.pretendard(size: 16, family: .Medium)
//            $0.textAlignment = .center
//            // 현재 location인 Label만 노란색으로 글씨색 설정
//            if let myLocation = self.myLocation {
//                if myLocation == viewModel.myTowns[itemIdx] {$0.textColor = .zatchDeepYellow}
//            } else {
//                if itemIdx == 0 {$0.textColor = .zatchDeepYellow}
//            }
//        }
        let currentIndex = try? viewModel.currentTownIndex.value()
        if(indexPath.row == currentIndex ?? 0){
            cell.backgroundColor = .purple
            print(viewModel.myTowns[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.changeCurrentTown(index: indexPath.row)
        self.dismiss(animated: true)
    }
}
