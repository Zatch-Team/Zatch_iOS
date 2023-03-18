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
    private let locationTableView = UITableView().then{
        $0.register(cellType: BaseBottomSheetTableViewCell.self)
    }
    
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

//MARK: - TableViewDelegate
extension ChangeLocationSheetViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.myTownCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(for: indexPath, cellType: BaseBottomSheetTableViewCell.self).then{ cell in
            cell.setTitle(viewModel.getTownName(by: indexPath.row))
            if(indexPath.row == viewModel.getCurrentTownIndex()){
                cell.setSelectState()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.changeCurrentTown(index: indexPath.row)
        self.dismiss(animated: true)
    }
}
