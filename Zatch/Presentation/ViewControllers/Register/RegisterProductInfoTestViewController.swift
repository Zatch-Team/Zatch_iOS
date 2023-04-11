//
//  RegisterProductInfoTestViewController.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/11.
//

import Foundation
import RxSwift
import RxCocoa

final class RegisterProductInfoTestViewController: BaseViewController<LeftNavigationHeaderView, ZatchRegisterFirstView>{
    
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
            mainView.backTableView.cellForRow(at: DETAIL_OPEN_CELL_INDEX, cellType: RegisterCategorySelectTableViewCell.self).isSubViewOpen = isDetailCellOpen
            mainView.backTableView.reloadSections(IndexSet.init(integer: 1), with: .automatic)
            mainView.backTableView.isScrollEnabled = Device.isSmallDevice ? true : isDetailCellOpen
        }
    }
    
    private let CATEGORY_CELL_INDEX: IndexPath = [0,0]
    private let PRODUCT_NAME_CELL_INDEX: IndexPath = [0,1]
    private let DETAIL_OPEN_CELL_INDEX: IndexPath = [0,3]
    
    private let viewModel = FirstRegisterTestViewModel()
    private let categoryBottomSheet = CategorySheetViewController()
    
    private let categoryRelay = PublishRelay<Int>()
    private let countSubject = PublishSubject<String>()
    private let buyDateSubject = PublishSubject<String>()
    private let endDateSubject = PublishSubject<String>()
    private let isOpenSubject = BehaviorRelay<Bool>(value: false)
    
    //MARK: - Template Method
    
    override func initialize(){
        super.initialize()
        mainView.backTableView.initializeDelegate(self)
    }
    
    override func bindAfterViewAppear() {
        
        viewModel.textFieldObservable = mainView.backTableView
            .cellForRow(at: PRODUCT_NAME_CELL_INDEX,
                        cellType: TextFieldTabeViewCell.self)
            .textObservable
        
        categoryRelay
            .subscribe(onNext: {
                self.mainView.backTableView
                    .cellForRow(at: self.CATEGORY_CELL_INDEX,
                                cellType: RegisterCategorySelectTableViewCell.self)
                    .setCategoryTitle(id: $0)
            }).disposed(by: disposeBag)
        
        
        let input = FirstRegisterTestViewModel.Input(categoryId: categoryRelay.asObservable())
        _ = viewModel.transform(input)
    }
}

//MARK: - UITableViewDelegate

extension RegisterProductInfoTestViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 4 : isDetailCellOpen ? 4 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:     return getBasicInformationCells(indexPath: indexPath)
        case 1:     return getDetailInformationCells(indexPath: indexPath)
        default:    fatalError("재치 등록 TableView Cell indexPath 오류")
        }
    }
    
    private func getBasicInformationCells(indexPath: IndexPath) -> BaseTableViewCell{
        switch indexPath.row{
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
        return mainView.backTableView.dequeueReusableCell(for: indexPath, cellType: ImageAddTableViewCell.self)
    }
    
    private func getRegisterCategorySelectTableViewCell(indexPath: IndexPath) -> BaseTableViewCell{
        return mainView.backTableView.dequeueReusableCell(for: indexPath, cellType: RegisterCategorySelectTableViewCell.self).then{
            $0.setDefaultTitle("입력사항 더보기")
        }
    }
    
    private func getDetailInformationCells(indexPath: IndexPath) -> BaseTableViewCell{
        switch indexPath.row{
        case 0:         return getProductQuantityTableViewCell(indexPath: indexPath)
        case 1:         return getDateSelectTableViewCell(about: .buy, indexPath: indexPath)
        case 2:         return getDateSelectTableViewCell(about: .end, indexPath: indexPath)
        case 3:         return getProductIsOpenTableViewCell(indexPath: indexPath)
        default:        fatalError("재치 등록 section 0 TableView Cell indexPath 오류")
        }
    }
    
    private func getProductQuantityTableViewCell(indexPath: IndexPath) -> BaseTableViewCell{
        return mainView.backTableView.dequeueReusableCell(for: indexPath, cellType: ProductQuantityTableViewCell.self)
    }
    
    private func getDateSelectTableViewCell(about type: Register.ProductDate, indexPath: IndexPath) -> BaseTableViewCell{
        return mainView.backTableView.dequeueReusableCell(for: indexPath, cellType: ProductDateChoiceTableViewCell.self).then{
            $0.setTitle(type: type)
        }
    }
    
    private func getProductIsOpenTableViewCell(indexPath: IndexPath) -> BaseTableViewCell{
        return mainView.backTableView.dequeueReusableCell(for: indexPath, cellType: ProductIsOpenTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
        switch indexPath{
        case CATEGORY_CELL_INDEX:
            categoryBottomSheetWillOpen()
        case DETAIL_OPEN_CELL_INDEX:
            isDetailCellOpen.toggle()
        default:
            return
        }
    }
    
    private func categoryBottomSheetWillOpen(){
        categoryBottomSheet.show(in: self)
        categoryBottomSheet.completion = { [weak self] in
            self?.categoryRelay.accept($0)
        }
    }
}
