//
//  GatchDetailViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/02.
//

import UIKit

class GatchDetailViewController: BaseViewController {
    
    let mainView = GatchDetailView().then{
        $0.bottomFixView.recruitFinishButton.addTarget(self, action: #selector(recruitFinishButtonDidClicked), for: .touchUpInside)
    }
    
    override init() {
        super.init(rightButton: Image.dot)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        
        super.layout()
        
        self.view.addSubview(mainView)
        self.view.bringSubviewToFront(self.navigationView)
        mainView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    override func initialize() {
        mainView.infoTableView.separatorStyle = .none
        mainView.infoTableView.delegate = self
        mainView.infoTableView.dataSource = self
        
        self.rightPositionButton?.addTarget(self, action: #selector(detailEtcBottomSheetWillShow), for: .touchUpInside)
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailImageTableViewCell.cellIdentifier, for: indexPath) as? DetailImageTableViewCell else { return UITableViewCell() }
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: GatchDetailInfomationTableViewCell.cellIdentifier, for: indexPath) as? GatchDetailInfomationTableViewCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}
