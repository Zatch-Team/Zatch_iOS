//
//  GatchDetailViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/02.
//

import UIKit

class GatchDetailViewController: BaseViewController<EtcButtonHeader, GatchDetailView> {
    
    init(){
        super.init(headerView: EtcButtonHeader(image: Image.dot), mainView: GatchDetailView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        
        super.layout()
        
        self.view.bringSubviewToFront(self.headerView)
        mainView.snp.updateConstraints{
            $0.top.equalToSuperview()
        }
    }
    
    override func initialize() {
        mainView.infoTableView.separatorStyle = .none
        mainView.infoTableView.delegate = self
        mainView.infoTableView.dataSource = self

        mainView.bottomFixView.recruitFinishButton.addTarget(self, action: #selector(recruitFinishButtonDidClicked), for: .touchUpInside)
        headerView.etcButton.addTarget(self, action: #selector(detailEtcBottomSheetWillShow), for: .touchUpInside)
    }
    
    @objc private func detailEtcBottomSheetWillShow() {
        let sheet = DetailEtcBottomSheetViewController().show(in: self)
    }
    
    @objc private func recruitFinishButtonDidClicked(){
        mainView.bottomFixView.setRecruitFinishButtonDeactivationStatus()
    }

}

extension GatchDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: DetailImageTableViewCell.self)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: GatchDetailInfomationTableViewCell.self)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}
