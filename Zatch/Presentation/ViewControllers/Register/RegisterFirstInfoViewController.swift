//
//  RegisterProductInfoTestViewController.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/11.
//

import Foundation
import RxSwift
import RxCocoa

final class RegisterFirstInfoViewController: BaseViewController<LeftNavigationHeaderView, ZatchRegisterFirstView>{
    
    //MARK: - Generator
    
    init(){
        super.init(headerView: LeftNavigationHeaderView(title: "재치 등록하기"),
                   mainView: ZatchRegisterFirstView())
    }
    
    required init?(coder: NSCoder) {
        super.init(headerView: LeftNavigationHeaderView(title: "재치 등록하기"),
                   mainView: ZatchRegisterFirstView())
    }
    
    //MARK: - Property
    
    private var isDetailCellOpen = false {
        didSet{
            mainView.backTableView.do{
                $0.cellForRow(
                    at: DETAIL_OPEN_CELL_INDEX,
                    cellType: RegisterCategorySelectTableViewCell.self
                )?
                .isSubViewOpen = isDetailCellOpen
                
                $0.reloadSections(IndexSet.init(integer: 1), with: .automatic)
                $0.isScrollEnabled = Device.isSmallDevice ? true : isDetailCellOpen
            }
        }
    }
    
    private let CATEGORY_CELL_INDEX: IndexPath = [0,0]
    private let PRODUCT_NAME_CELL_INDEX: IndexPath = [0,1]
    private let DETAIL_OPEN_CELL_INDEX: IndexPath = [0,3]
    private let BUY_DATE_CELL_INDEX: IndexPath = [1,1]
    private let END_DATE_CELL_INDEX: IndexPath = [1,2]
    
    private let viewModel = RegisterFirstInfoTestViewModel()
    private let categoryBottomSheet = CategorySheetViewController()
    
    //불충족 조건 파악 위한 모든 Relay에 기본 값 설정
    private let categoryRelay = BehaviorRelay<Int?>(value: nil)
    private let countSubject = BehaviorSubject<String>(value: "")
    private let countUnitSubject = BehaviorRelay<String?>(value: nil)
    private let buyDateSubject = BehaviorRelay<Register.DateString?>(value: nil)
    private let endDateSubject = BehaviorRelay<Register.DateString?>(value: nil)
    private let isOpenRelay = BehaviorRelay<Int>(value: Register.ProductOpenState.unopen.rawValue)
    
    //MARK: - Template Method
    
    override func initialize(){
        super.initialize()
        mainView.backTableView.initializeDelegate(self)
    }
    
    override func bindAfterViewAppear() {
    
        viewModel.productName = mainView.backTableView
            .cellForRow(at: PRODUCT_NAME_CELL_INDEX,
                        cellType: TextFieldTabeViewCell.self)?
            .textObservable
            .startWith("")
            .share()
        
        viewModel.images = mainView.backTableView
            .cellForRow(at: [0,2],
                        cellType: ImageAddTableViewCell.self)?
            .imagesRelay
            .asObservable()
            .share()
        
        categoryRelay
            .subscribe(onNext: { id in
                if let id = id{
                    self.mainView.backTableView
                        .cellForRow(at: self.CATEGORY_CELL_INDEX,
                                    cellType: RegisterCategorySelectTableViewCell.self)?
                        .setCategory(id: id)
                }
            }).disposed(by: disposeBag)

        buyDateSubject
            .skip(1) //유효 조건 판단 위해 설정한 초기값 nil은 skip
            .subscribe(onNext: {
                self.mainView.backTableView
                    .cellForRow(at: self.BUY_DATE_CELL_INDEX,
                                cellType: ProductDateChoiceTableViewCell.self)?
                    .setDate($0)
            }).disposed(by: disposeBag)
        
        endDateSubject
            .skip(1) //유효 조건 판단 위해 설정한 초기값 nil은 skip
            .subscribe(onNext: {
                self.mainView.backTableView
                    .cellForRow(at: self.END_DATE_CELL_INDEX,
                                cellType: ProductDateChoiceTableViewCell.self)?
                    .setDate($0)
            }).disposed(by: disposeBag)
        
        
        let input = RegisterFirstInfoTestViewModel
            .Input(nextButtonTap: mainView.nextButton.rx.tap,
                   categoryId: categoryRelay.asObservable(),
                   count: countSubject.asObservable(),
                   countUnit: countUnitSubject.asObservable(),
                   buyDate: buyDateSubject.asObservable(),
                   endDate: endDateSubject.asObservable(),
                   isOpen: isOpenRelay.asObservable()
            )
        
        let output = viewModel.transform(input)
        
        output.zatchDTO
            .drive(onNext: { zatchInformation in
                if let zatchInformation = zatchInformation {
                    self.moveNextViewController(zatchDTO: zatchInformation)
                }
            }).disposed(by: disposeBag)
        
        output.dissatisfactionType
            .drive(onNext: {
                $0.show(in: self)
            }).disposed(by: disposeBag)
    }
    
    private func moveNextViewController(zatchDTO: RegisterFirstInformationDTO){
        let vc = RegisterSecondInfoViewController(firstInformation: zatchDTO)
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - UITableViewDelegate

extension RegisterFirstInfoViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 4 : isDetailCellOpen ? 4 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:     return getBasicInformationCells(indexPath: indexPath)
        case 1:     return getDetailInformationCells(indexPath: indexPath)
        default:    fatalError("재치 등록 TableView Cell indexPath 오류")
        }
    }
    
    private func getBasicInformationCells(indexPath: IndexPath) -> BaseTableViewCell{
        switch indexPath.row {
        case 0:     return getCategorySelectTableViewCell(indexPath: indexPath)
        case 1:     return getTextFieldTableViewCell(indexPath: indexPath)
        case 2:     return getImageAddTableViewCell(indexPath: indexPath)
        case 3:     return getRegisterCategorySelectTableViewCell(indexPath: indexPath)
        default:    fatalError("재치 등록 section 0 TableView Cell indexPath 오류")
        }
    }
    
    private func getCategorySelectTableViewCell(indexPath: IndexPath) -> BaseTableViewCell{
        return mainView.backTableView.dequeueReusableCell(for: indexPath, cellType: RegisterCategorySelectTableViewCell.self)
    }
    
    private func getTextFieldTableViewCell(indexPath: IndexPath) -> BaseTableViewCell{
        return mainView.backTableView.dequeueReusableCell(for: indexPath, cellType: TextFieldTabeViewCell.self).then{
            $0.informationTypeTest = .product
        }
    }
    
    private func getImageAddTableViewCell(indexPath: IndexPath) -> BaseTableViewCell{
        return mainView.backTableView.dequeueReusableCell(for: indexPath, cellType: ImageAddTableViewCell.self).then{
            $0.navigationController = self.navigationController
        }
    }
    
    private func getRegisterCategorySelectTableViewCell(indexPath: IndexPath) -> BaseTableViewCell{
        return mainView.backTableView.dequeueReusableCell(for: indexPath, cellType: MoreInformationTableViewCell.self).then{
            $0.setTitle("입력사항 더보기")
        }
    }
    
    private func getDetailInformationCells(indexPath: IndexPath) -> BaseTableViewCell{
        switch indexPath.row {
        case 0:         return getProductQuantityTableViewCell(indexPath: indexPath)
        case 1:         return getDateSelectTableViewCell(about: .buy, indexPath: indexPath)
        case 2:         return getDateSelectTableViewCell(about: .end, indexPath: indexPath)
        case 3:         return getProductIsOpenTableViewCell(indexPath: indexPath)
        default:        fatalError("재치 등록 section 0 TableView Cell indexPath 오류")
        }
    }
    
    private func getProductQuantityTableViewCell(indexPath: IndexPath) -> BaseTableViewCell{
        return mainView.backTableView.dequeueReusableCell(for: indexPath, cellType: ProductQuantityTableViewCell.self).then{
            $0.delegate = self
            $0.countTextField.delegate = self
        }
    }
    
    private func getDateSelectTableViewCell(about type: Register.ProductDate, indexPath: IndexPath) -> BaseTableViewCell{
        return mainView.backTableView.dequeueReusableCell(for: indexPath, cellType: ProductDateChoiceTableViewCell.self).then{
            $0.productDateType = type
            $0.delegate = self
        }
    }
    
    private func getProductIsOpenTableViewCell(indexPath: IndexPath) -> BaseTableViewCell{
        return mainView.backTableView.dequeueReusableCell(for: indexPath, cellType: ProductIsOpenTableViewCell.self).then{
            $0.delegate = self
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
        switch indexPath{
        case CATEGORY_CELL_INDEX:           categoryBottomSheetWillOpen()
        case DETAIL_OPEN_CELL_INDEX:        isDetailCellOpen.toggle()
        case BUY_DATE_CELL_INDEX:           datePickerWillShow(about: .buy)
        case END_DATE_CELL_INDEX:           datePickerWillShow(about: .end)
        default:                            return
        }
    }
    
    private func categoryBottomSheetWillOpen(){
        categoryBottomSheet.show(in: self)
        categoryBottomSheet.completion = { [weak self] in
            self?.categoryRelay.accept($0)
        }
    }
    
    private func datePickerWillShow(about type: Register.ProductDate){
        
        if isNotConfirmedState(type: type) { return }
         
        let datePicker = DatePickerAlertViewController(about: type).show(in: self)
        datePicker.completionTest = { [weak self] in
            switch type{
            case .buy:      self?.buyDateSubject.accept($0)
            case .end:      self?.endDateSubject.accept($0)
            }
        }
    }
    
    private func isNotConfirmedState(type: Register.ProductDate) -> Bool{
        let indexPath = {
            switch type {
            case .buy:  return self.BUY_DATE_CELL_INDEX
            case .end:  return self.END_DATE_CELL_INDEX
            }
        }()
        guard let cell = mainView.backTableView.cellForRow(at: indexPath,cellType: ProductDateChoiceTableViewCell.self) else { fatalError() }
        return cell.isNotConfirmed
    }
}

extension RegisterFirstInfoViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        countSubject.onNext(textField.text ?? "")
    }
}

//MARK: - ProductRegisterDelegate

extension RegisterFirstInfoViewController: RegisterFirstInfoDelegate{
    
    func willShowUnitBottomSheet() {
        //임시
        countUnitSubject.accept("개")
    }
    
    func changeIsOpenState(_ state: Int) {
        isOpenRelay.accept(state)
    }
    
    func dateNotConfirmed(about type: Register.ProductDate) {
        switch type{
        case .buy:      buyDateSubject.accept(nil)
        case .end:      endDateSubject.accept(nil)
        }
    }
}
