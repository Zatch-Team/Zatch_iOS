//
//  SearchResultViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/01.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture

class ZatchSearchResultViewController: BaseViewController<BaseHeaderView, ZatchSearchResultView>, UIGestureRecognizerDelegate {
    
    @frozen
    enum ProductType{
        case myProduct
        case wantProduct
    }
    
    private var isProductNameEditing: Bool = false{
        didSet{
            changeProductTextFieldHiddenState()
            changeProductLabelHiddenState()
        }
    }
    private lazy var productFrames: [ZatchSearchResultView.SearchFieldFrame] = [mainView.myZatchFrame, mainView.wantZatchFrame]

    //MARK: - Properties
    
    private let viewModel = ZatchSearchResultViewModel()
    private let registerZatchBottomSheetInstance = SearchMyRegisterZatchSheetViewController()
    private let lookingForZatchBottomSheetInstance = SearchWantRegisterZatchSheetViewController()
    private let categoryBottomSheet = CategorySheetViewController()
    
    init(){
        super.init(headerView: BaseHeaderView(), mainView: ZatchSearchResultView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewControllerWillPop() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func initialize() {
        
        super.initialize()
        
        setTagWithProductType()
        
        mainView.tableView.initializeDelegate(self)
    }
    
    private func setTagWithProductType(){
        let myZatchFrame = mainView.myZatchFrame
        [myZatchFrame, myZatchFrame.productLabel, myZatchFrame.categortBtn].forEach{
            $0.tag = ProductType.myProduct.tag
        }
        
        let wantZatchFrame = mainView.wantZatchFrame
        [wantZatchFrame, wantZatchFrame.productLabel, wantZatchFrame.categortBtn].forEach{
            $0.tag = ProductType.wantProduct.tag
        }
    }
    
    override func bind() {
        
        let input = ZatchSearchResultViewModel.Input()
        let output = viewModel.transform(input)
        
        output.willEmptyViewHidden
            .drive{ [weak self] in
                self?.mainView.tableView.backgroundView?.isHidden = $0
            }.disposed(by: disposeBag)
        
        output.myProductName
            .drive{ [weak self] in
                self?.mainView.myZatchFrame.productLabel.text = $0
            }.disposed(by: disposeBag)
        
        output.wantProductName
            .drive{ [weak self] in
                self?.mainView.wantZatchFrame.productLabel.text = $0
            }.disposed(by: disposeBag)
        
        output.isMyProductCategorySelect
            .drive(mainView.myZatchFrame.categortBtn.rx.isSelected)
            .disposed(by: disposeBag)
        
        output.isWantProductCategorySelect
            .drive(mainView.wantZatchFrame.categortBtn.rx.isSelected)
            .disposed(by: disposeBag)
        
        mainView.townFrame.rx.tapGesture()
            .when(.recognized)
            .bind(onNext: { [weak self] _ in
                self?.townSettingBottomSheetWillShow()
            }).disposed(by: disposeBag)
        
        setProductFramesRx()
    }
    
    private func setProductFramesRx(){
        
        productFrames.forEach{
            //Category
            $0.categortBtn.rx.tapGesture()
                .when(.recognized)
                .bind(onNext: { [weak self] in
                    self?.willShowCategoryBottomSheet(recognizer: $0)
                }).disposed(by: disposeBag)
            
            //TextField
            $0.productTextField.rx.controlEvent([.editingDidEndOnExit])
                .bind(onNext: { [weak self] in
                    self?.viewModel.pressTextFieldReturnKey(myProduct: self?.mainView.myZatchFrame.productTextField.text,
                                                            wantProduct: self?.mainView.wantZatchFrame.productTextField.text)
                    self?.productTextFieldDidPressReturnKey()
                }).disposed(by: disposeBag)
            
            //Product Label
            $0.productLabel
                .addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(willShowZatchBottomSheet(_:))))
            
            $0.productLabel
                .addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(productNameTextFieldWillShow)))
            
            //        mainView.myZatchFrame.productLabel.rx.tapGesture()
            //            .when(.recognized)
            //            .bind{ [weak self] _ in
            //                print("tap test")
            //                self?.openMyZatchBottomSheet()
            //            }.disposed(by: disposeBag)
            //
            //        mainView.myZatchFrame.productLabel.rx.longPressGesture()
            //            .when(.recognized)
            //            .bind{ [weak self] in
            //                print("long press test")
            //                self?.textFieldDidPressedLong($0)
            //            }.disposed(by: disposeBag)
        }
    }
    
    private func getProductType(of: UIView) -> ProductType{
        switch of.tag{
        case ProductType.myProduct.tag:         return .myProduct
        case ProductType.wantProduct.tag:       return .wantProduct
        default:                                fatalError()
        }
    }
    
    @objc private func willShowZatchBottomSheet(_ recognizer: UITapGestureRecognizer){
        if let recognizeView = recognizer.view{
            switch getProductType(of: recognizeView){
            case .myProduct:
                registerZatchBottomSheetInstance.show(in: self)
            case .wantProduct:
                lookingForZatchBottomSheetInstance.show(in: self)
            }
        }
    }
    
    @objc private func willShowCategoryBottomSheet(recognizer: UITapGestureRecognizer){
        categoryBottomSheet.show(in: self)
        categoryBottomSheet.completion = { [weak self] categoryId in
            if let view = recognizer.view{
                self?.setCategoryIdWithCheckProductType(categoryId, recognizer: view)
            }
        }
    }
    
    private func setCategoryIdWithCheckProductType(_ id: Int, recognizer view: UIView) {
        switch getProductType(of: view){
        case .myProduct:
            viewModel.setMyProductCategory(id: id)
        case .wantProduct:
            viewModel.setWantProductCategory(id: id)
        }
    }
    
    //TextField 입력 끝나거나 취소됐을 경우
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isProductNameEditing = false
        view.endEditing(true)
    }
    
    @objc func productNameTextFieldWillShow(_ recognizer : UIGestureRecognizer){
        
        guard let recognizerView = recognizer.view else { return }
        
        isProductNameEditing = true
        
        //기존 입력값 초기화
        initializeTextField()

        //커서 올리기
        let textField: UITextField = {
            switch getProductType(of: recognizerView){
            case .myProduct:        return mainView.myZatchFrame.productTextField
            case .wantProduct:      return mainView.wantZatchFrame.productTextField
            }
        }()
        textField.becomeFirstResponder()
    }
    
    private func initializeTextField(){
        productFrames.forEach{
            $0.productTextField.text = nil
            $0.productTextField.placeholder = $0.productLabel.text
        }
    }
    
    private func productTextFieldDidPressReturnKey(){
        isProductNameEditing = false
    }
    
    private func changeProductTextFieldHiddenState(){
        productFrames.forEach{
            $0.productTextField.isHidden = !isProductNameEditing
        }
    }
    
    private func changeProductLabelHiddenState(){
        productFrames.forEach{
            $0.productLabel.isHidden = isProductNameEditing
        }
    }
    
    @objc func townSettingBottomSheetWillShow(){
        let vc = TownSettingSheetViewController().show(in: self)
        vc.completion = { town in
            print(town)
        }
    }

}

extension ZatchSearchResultViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getSearchResultCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //임시 조건문 설정
        let data = viewModel.getZatch(at: indexPath.row)
        if(indexPath.row < 5){
            return tableView.dequeueReusableCell(for: indexPath, cellType: ZatchShareTableViewCell.self).then{
                $0.bindingData()
            }
        }else{
            return tableView.dequeueReusableCell(for: indexPath, cellType: ZatchExchangeTableViewCell.self).then{
                $0.bindingData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(ZatchDetailViewController(), animated: true)
    }
}

extension ZatchSearchResultViewController.ProductType{
    var tag: Int{
        switch self{
        case .myProduct:        return 100
        case .wantProduct:      return 200
        }
    }
}
