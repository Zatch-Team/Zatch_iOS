//
//  RegisterSecondInfoViewController.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/12.
//

import Foundation
import RxSwift
import RxCocoa

class RegisterSecondInfoViewController: BaseViewController<LeftNavigationEtcButtonHeaderView,ZatchRegisterSecondView>{
    
    private let myProductInfo: RegisterFirstInformationDTO

    init(firstInformation: RegisterFirstInformationDTO){
        self.myProductInfo = firstInformation
        super.init(headerView: LeftNavigationEtcButtonHeaderView(title: "재치 등록하기", etcButton: Image.exit),
                   mainView: ZatchRegisterSecondView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var isCategoryFieldOpen = [true, false, false]

    private let CATEGORY_ROW = 1
    
    private let viewModel = RegisterSecondInfoViewModel()
    private let categoryBottomSheet = CategorySheetViewController()
    
    private let firstCategorySubject = BehaviorRelay<Int?>(value: nil)
    private let firstProductNameSubject = BehaviorSubject<String>(value: "")
    private let secondCategorySubject = BehaviorRelay<Int?>(value: nil)
    private let secondProductNameSubject = BehaviorSubject<String>(value: "")
    private let thirdCategorySubject = BehaviorRelay<Int?>(value: nil)
    private let thirdProductNameSubject = BehaviorSubject<String>(value: "")
    private let wantProductTypeSubject = BehaviorSubject<Register.WantZatch>(value: .anyZatch)
    
    override func initialize() {
        mainView.tableView.initializeDelegate(self)
        setButtonTarget()
    }
    
    private func setButtonTarget(){
        headerView.etcButton.addTarget(self, action: #selector(exitBtnDidClicked), for: .touchUpInside)
    }
    
    override func bind() {
        
        secondCategorySubject
            .skip(1) //기본 값 nil skip
            .first()
            .subscribe{ [weak self] _ in
                self?.reloadSection(1)
            }.disposed(by: disposeBag)
        
        thirdCategorySubject
            .skip(1) //기본 값 nil skip
            .first()
            .subscribe{ [weak self] _ in
                self?.reloadSection(2)
            }.disposed(by: disposeBag)
        
        firstCategorySubject
            .compactMap{
                $0
            }.subscribe{ [weak self] in
                self?.bindingCategoryCell(section: 0, categoryId: $0)
            }.disposed(by: disposeBag)
        
        secondCategorySubject
            .compactMap{
                $0
            }.subscribe{ [weak self] in
                self?.bindingCategoryCell(section: 1, categoryId: $0)
            }.disposed(by: disposeBag)
        
        thirdCategorySubject
            .compactMap{
                $0
            }.subscribe{ [weak self] in
                self?.bindingCategoryCell(section: 2, categoryId: $0)
            }.disposed(by: disposeBag)
        
        let input = RegisterSecondInfoViewModel.Input(firstPriorityCategory: firstCategorySubject.asObservable(),
                                                      firstProductName: firstProductNameSubject.asObservable(),
                                                      secondPriorityCategory: secondCategorySubject.asObservable(),
                                                      secondProductName: secondProductNameSubject.asObservable(),
                                                      thirdPriorityCategory: thirdCategorySubject.asObservable(),
                                                      thirdProductName: thirdProductNameSubject.asObservable(),
                                                      wantProductType: wantProductTypeSubject.asObservable(),
                                                      shareButtonTap: mainView.shareBtn.rx.tap,
                                                      nextButtonTap: mainView.nextBtn.rx.tap)
        
        let output = viewModel.transform(input)
        
        output.productsInputEmpty
            .subscribe(onNext: { secondInfo in
                let alert = Alert.ChangeShare.show(in: self)
                alert.completion = {
                    self.moveShareViewController(with: secondInfo)
                }
            }).disposed(by: disposeBag)
        
        output.moveShare
            .subscribe(onNext: { [weak self] in
                self?.moveShareViewController(with: $0)
            }).disposed(by: disposeBag)
        
        output.moveExchange
            .subscribe(onNext: { [weak self] in
                self?.moveExchangeViewController(with: $0)
            }).disposed(by: disposeBag)
    }
    
    private func reloadSection(_ section: Int){
        defer{
            if(isCategoryFieldOpen.allSatisfy{ $0 }){
                mainView.tableView.isScrollEnabled = true
            }
        }
        isCategoryFieldOpen[section] = true
        mainView.tableView.reloadSections(IndexSet(integer: section), with: .none)
        mainView.tableView.scrollToRow(at: [section,2], at: .bottom, animated: true)
    }
    
    private func bindingCategoryCell(section: Int, categoryId: Int){
        mainView.tableView
            .cellForRow(at: [section, CATEGORY_ROW], cellType: RegisterCategorySelectTableViewCell.self)?
            .do{
                $0.setCategory(id: categoryId)
            }
    }
    
    private func moveShareViewController(with wantProductInfo: RegisterSecondInformationDTO){
        let vc = CheckShareRegisterViewController(myProductInfo: myProductInfo, wantProductInfo: wantProductInfo)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func moveExchangeViewController(with wantProductInfo: RegisterSecondInformationDTO){
        let vc = CheckExchangeRegisterViewController(myProductInfo: myProductInfo, wantProductInfo: wantProductInfo)
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
            $0.textObservable
                .subscribe(onNext: {
                    self.subscribeProductName($0, section: indexPath.section)
                }).disposed(by: disposeBag)
        }
    }
    
    private func subscribeProductName(_ value: String, section: Int){
        switch section{
        case 0:         firstProductNameSubject.onNext(value)
        case 1:         secondProductNameSubject.onNext(value)
        case 2:         thirdProductNameSubject.onNext(value)
        default:        return
        }
    }
    
    private func getAnyZatchSelectTableViewCell(indexPath: IndexPath) -> BaseTableViewCell {
        mainView.tableView.dequeueReusableCell(for: indexPath, cellType: AnyZatchSelectTableViewCell.self).then{
            $0.delegate = self
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 1){
            willShowCategoryBottomSheet(section: indexPath.section)
        }
    }
    
    private func willShowCategoryBottomSheet(section: Int){
        categoryBottomSheet.show(in: self)
        categoryBottomSheet.completion = { categoryId in
            self.getCategorySubject(section).accept(categoryId)
        }
    }
    
    private func getCategorySubject(_ section: Int) -> BehaviorRelay<Int?>{
        switch section{
        case 0:     return firstCategorySubject
        case 1:     return secondCategorySubject
        case 2:     return thirdCategorySubject
        default:    fatalError("section value range error")
        }
    }
}

extension RegisterSecondInfoViewController: RegisterSecondInfoDelegate{
    func selectWantZatchType(_ type: Register.WantZatch) {
        wantProductTypeSubject.onNext(type)
    }
}
