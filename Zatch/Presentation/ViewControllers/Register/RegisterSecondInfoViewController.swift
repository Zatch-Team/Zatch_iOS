//
//  RegisterSecondInfoViewController.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/12.
//

import Foundation

class RegisterSecondInfoViewController: BaseViewController<LeftNavigationEtcButtonHeaderView,ZatchRegisterSecondView>{
    
//    private let firstInformation: RegisterFirstInformationDTO
//
//    init(firstInformation: RegisterFirstInformationDTO){
//        self.firstInformation = firstInformation
//        super.init(headerView: LeftNavigationEtcButtonHeaderView(title: "재치 등록하기", etcButton: Image.exit),
//                   mainView: ZatchRegisterSecondView())
//    }
    
    init(){
        super.init(headerView: LeftNavigationEtcButtonHeaderView(title: "재치 등록하기", etcButton: Image.exit),
                   mainView: ZatchRegisterSecondView())
    }
    
    required init?(coder: NSCoder) {
        super.init(headerView: LeftNavigationEtcButtonHeaderView(title: "재치 등록하기", etcButton: Image.exit),
                   mainView: ZatchRegisterSecondView())
    }
    
    private var isCategoryFieldOpen = [true, false, false]{
        didSet{
            mainView.tableView.reloadData()
        }
    }
    
    override func initialize() {
        mainView.tableView.initializeDelegate(self)
        setButtonTarget()
    }
    
    private func setButtonTarget(){
        headerView.etcButton.addTarget(self, action: #selector(exitBtnDidClicked), for: .touchUpInside)
        mainView.shareBtn.addTarget(self, action: #selector(shareBtnDidClicked), for: .touchUpInside)
        mainView.nextBtn.addTarget(self, action: #selector(nextBtnDidClicked), for: .touchUpInside)
    }
    
    @objc private func shareBtnDidClicked(){
        let vc = CheckShareRegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func nextBtnDidClicked(){
        let vc = CheckExchangeRegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func exitBtnDidClicked(){
        navigationController?.popToRootViewController(animated: true)
    }
}

extension RegisterSecondInfoViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 3 ? 1 : section == 0 || isCategoryFieldOpen[section] ? 3 : 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 3){
            return getAnyZatchSelectTableViewCell(indexPath: indexPath)
        }
        switch indexPath.row{
        case 0:     return getPriorityTableViewCell(indexPath: indexPath)
        case 1:     return getCategorySelectTableViewCell(indexPath: indexPath)
        case 2:     return getProductNameTextFieldTableViewCell(indexPath: indexPath)
        default:    fatalError("재치 등록 받고 싶은 물건 TableView indexPath 오류")
        }
    }
    
    private func getPriorityTableViewCell(indexPath: IndexPath) -> BaseTableViewCell{
        mainView.tableView.dequeueReusableCell(for: indexPath, cellType: RegisterPriorityTableViewCell.self).then{
            $0.priority = indexPath.section + 1
        }
    }
    
    private func getCategorySelectTableViewCell(indexPath: IndexPath) -> BaseTableViewCell{
        mainView.tableView.dequeueReusableCell(for: indexPath, cellType: RegisterCategorySelectTableViewCell.self)
    }
    
    private func getProductNameTextFieldTableViewCell(indexPath: IndexPath) -> BaseTableViewCell{
        mainView.tableView.dequeueReusableCell(for: indexPath, cellType: TextFieldTabeViewCell.self).then{
            $0.informationTypeTest = .product
        }
    }
    
    private func getAnyZatchSelectTableViewCell(indexPath: IndexPath) -> BaseTableViewCell {
        mainView.tableView.dequeueReusableCell(for: indexPath, cellType: AnyZatchSelectTableViewCell.self)
    }
    
    
}
