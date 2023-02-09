//
//  RegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/11.
//

import UIKit
import RxGesture

class ZatchRegisterFirstViewController: BaseViewController<LeftNavigationHeaderView, ZatchRegisterFirstView> {
    
    //MARK: - Properties
    
    let categoryCellIndex: IndexPath = [0,0]
    let productNameCellIndex: IndexPath = [0,1]
    
    var isOpen = false
    let registerManager = ZatchRegisterRequestManager.shared
    let viewModel = ZatchRegisterFirstViewModel()
    let categoryBottomSheet = CategorySheetViewController()
    
    init(){
        super.init(headerView: LeftNavigationHeaderView(title: "재치 등록하기"),
                   mainView: ZatchRegisterFirstView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Override
    
    override func initialize(){
        
        super.initialize()
        
        mainView.backTableView.dataSource = self
        mainView.backTableView.delegate = self
        mainView.backTableView.separatorStyle = .none
    }
    
    override func bind() {
        
        categoryBottomSheet.rx.viewWillAppear
            .map{ _ in }
            .bind(onNext: {
                let cell = self.mainView.backTableView.cellForRow(at: self.categoryCellIndex, cellType: CategorySelectTableViewCell.self)
                cell.arrowImage.isSelected = true
            }).disposed(by: disposeBag)
        
        categoryBottomSheet.rx.viewWillDisappear
            .map{ _ in }
            .bind(onNext: {
                let cell = self.mainView.backTableView.cellForRow(at: self.categoryCellIndex, cellType: CategorySelectTableViewCell.self)
                cell.arrowImage.isSelected = false
            }).disposed(by: disposeBag)
        
        mainView.nextButton.rx.tap
            .bind{
                self.nextBtnDidClicked()
            }.disposed(by: disposeBag)
        
//        self.view.rx.tapGesture()
//            .when(.recognized)
//            .bind(onNext: { _ in
//                self.view.endEditing(true)
//            }).disposed(by: disposeBag)
    }
    
    //MARK: - Action
    
    @objc func nextBtnDidClicked(){
        //cell에서 등록한 이미지 데이터 가져오기
        guard let imageCell = mainView.backTableView.cellForRow(at: [0,2]) as? ImageAddTableViewCell else { return }
        registerManager.images = imageCell.imageArray
        
        let alert: Alert
        
        if(registerManager.categoryId == -1){
            alert = .RegisterCategory
        }else if(registerManager.productName.isEmpty){
            alert = .ProductName
        }else if(registerManager.images.count == 0){
            alert = .ImageMin
        }else if(registerManager.categoryId == 0 && registerManager.buyDate.isEmpty){
            alert = .BuyDate
        }else if(registerManager.categoryId == 0 && registerManager.endDate.isEmpty){
            alert = .EndDate
        }else{ //input 데이터 모두 유효할 경우, Second로 이동
            let vc  = ZatchRegisterSecondViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            return
        }
        
        _ = alert.generateAlert().show(in: self)
    }

}

extension ZatchRegisterFirstViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 3
        }
        return isOpen ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: CategorySelectTableViewCell.self)
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ProductNameTabeViewCell.self)
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ImageAddTableViewCell.self)
                cell.navigationController = self.navigationController
                return cell
            default:
                return BaseTableViewCell()
            }
        }else{
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: CategorySelectTableViewCell.self)
                cell.categoryText.text = "입력사항 더보기"
                cell.arrowImage.isSelected = !isOpen
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: FirstProductInfoTableView.self)
                cell.viewController = self
                return cell
            default:
                return BaseTableViewCell()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.view.endEditing(true)
        
        if(indexPath == categoryCellIndex){
            _ = categoryBottomSheet.show(in: self)
            categoryBottomSheet.completion = { category in
                let cell = tableView.cellForRow(at: indexPath, cellType: CategorySelectTableViewCell.self)
                cell.categoryText.text = category.0
                self.registerManager.categoryId = category.1
            }
            
        }else if(indexPath == [1,0]){
            let cell = tableView.cellForRow(at: indexPath, cellType: CategorySelectTableViewCell.self)
            isOpen.toggle()
            cell.arrowImage.isSelected = isOpen
            self.mainView.backTableView.reloadSections(IndexSet.init(integer: indexPath.section), with: .none)
        }
    }
    
}

