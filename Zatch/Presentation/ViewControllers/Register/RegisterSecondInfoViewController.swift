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
    
    private var isCategoryFieldOpen = [true, false, false]

    private let CATEGORY_ROW = 1
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
        mainView.shareBtn.addTarget(self, action: #selector(shareBtnDidClicked), for: .touchUpInside)
        mainView.nextBtn.addTarget(self, action: #selector(nextBtnDidClicked), for: .touchUpInside)
    }
    
    override func bind() {
        
        firstProductNameSubject.subscribe(onNext: {
            print("first",$0)
        })
        
        secondCategorySubject
            .skip(1)
            .first()
            .subscribe{ [weak self] _ in
                self?.reloadSection(1)
            }.disposed(by: disposeBag)
        
        thirdCategorySubject
            .skip(1)
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
            .cellForRow(at: [section, CATEGORY_ROW], cellType: RegisterCategorySelectTableViewCell.self)
            .do{
                $0.setCategoryTitle(id: categoryId)
            }
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
            $0.textObservable
                .subscribe(onNext: {
                    self.subscribeProductName($0, section: indexPath.section)
                }).disposed(by: disposeBag)
        }
    }
    
    private func subscribeProductName(_ value: String, section: Int){
        switch section{
        case 0:         self.firstProductNameSubject.onNext(value)
        case 1:         self.secondProductNameSubject.onNext(value)
        case 2:         self.thirdProductNameSubject.onNext(value)
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
