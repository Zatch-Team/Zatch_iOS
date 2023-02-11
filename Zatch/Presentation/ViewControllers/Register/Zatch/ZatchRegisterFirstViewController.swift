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
    
    private let categoryCellIndex: IndexPath = [0,0]
    private let productNameCellIndex: IndexPath = [0,1]
    private let informationDetailOpenCellIndex: IndexPath = [1,0]
    
    private var isInformationDetailCellOpen = false{
        didSet{
            mainView.backTableView.reloadSections(IndexSet.init(integer: 1), with: .none)
        }
    }
    private let registerManager = ZatchRegisterRequestManager.shared
    private let viewModel = ZatchRegisterFirstViewModel()
    private let categoryBottomSheet = CategorySheetViewController()
    
    init(){
        super.init(headerView: LeftNavigationHeaderView(title: "재치 등록하기"),
                   mainView: ZatchRegisterFirstView())
    }
    
    required init?(coder: NSCoder) {
        super.init(headerView: LeftNavigationHeaderView(title: "재치 등록하기"),
                   mainView: ZatchRegisterFirstView())
    }
    
    //MARK: - Override
    
    override func viewWillAppear(_ animated: Bool) {
        registerManager.initialize()
    }
    
    override func initialize(){
        
        super.initialize()
        
        mainView.backTableView.dataSource = self
        mainView.backTableView.delegate = self
        mainView.backTableView.separatorStyle = .none
    }
    
    override func bind() {
        
        categoryBottomSheet.rx.viewWillAppear
            .map{ _ in }
            .bind(onNext: { [self] in
                let cell = mainView.backTableView.cellForRow(at: categoryCellIndex, cellType: RegisterCategorySelectTableViewCell.self)
                cell.isSubViewOpen = true
            }).disposed(by: disposeBag)
        
        categoryBottomSheet.rx.viewWillDisappear
            .map{ _ in }
            .bind(onNext: {
                let cell = self.mainView.backTableView.cellForRow(at: self.categoryCellIndex, cellType: RegisterCategorySelectTableViewCell.self)
                cell.isSubViewOpen = false
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
        return isInformationDetailCellOpen ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: RegisterCategorySelectTableViewCell.self)
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: TextFieldTabeViewCell.self)
                cell.informationType = .myProduct
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
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: RegisterCategorySelectTableViewCell.self).then{
                    $0.setDefaultTitle("입력사항 더보기")
                    $0.isSubViewOpen = !isInformationDetailCellOpen
                }
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ProductDetailInputTableViewCell.self).then{
                    $0.delegate = self
                }
                return cell
            default:
                return BaseTableViewCell()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.view.endEditing(true)
        
        switch indexPath{
        case categoryCellIndex:
            categoryBottomSheetWillOpen()
            return
        case informationDetailOpenCellIndex:
            informationDetailInputCellWillOpen()
            return
        default:
            return
        }
    }
    
    private func categoryBottomSheetWillOpen(){
        _ = categoryBottomSheet.show(in: self)
        categoryBottomSheet.completion = { [self] categoryId in
            let cell = mainView.backTableView.cellForRow(at: categoryCellIndex, cellType: RegisterCategorySelectTableViewCell.self)
            cell.setCategoryTitle(id: categoryId)
            self.registerManager.categoryId = categoryId
        }
    }
    
    private func informationDetailInputCellWillOpen(){
        isInformationDetailCellOpen.toggle()
    }
}

//MARK: - ImageDelegate
extension ZatchRegisterFirstViewController{
    
}

//MARK: - ProductDetailDelegate

extension ZatchRegisterFirstViewController: RegisterCellDelegate{
    
    func datePickerWillShow(dateType: ProductDetailInputTableViewCell.ProductDate, cell: ProductDateChoiceTableViewCell) {
        
        let vc = DatePickerAlertViewController().show(in: self)
        vc.titleLabel.text = dateType.rawValue
        vc.pickerHandler = { array in
            cell.yearTextField.text = String (array[0])
            cell.monthTextField.text = String (array[1] + 1)
            cell.dateTextField.text = String (array[2] + 1)
            
            let date = "\(array[0])-\(array[1] + 1)-\(array[2] + 1)"
            dateType.update(date: date)
        }
    }
}

