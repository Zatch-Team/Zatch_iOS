//
//  CheckRegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/11.
//

import UIKit
import RxSwift

class CheckRegisterViewController: BaseViewController<LeftNavigationEtcButtonHeaderView, CheckRegisterView> {
    
    let myProductInfo: RegisterFirstInformationDTO
    let wantProductInfo: RegisterSecondInformationDTO
    
    init(myProductInfo: RegisterFirstInformationDTO,
         wantProductInfo: RegisterSecondInformationDTO,
         infoView: MyProductInformationView){
        self.myProductInfo = myProductInfo
        self.wantProductInfo = wantProductInfo
        super.init(headerView: LeftNavigationEtcButtonHeaderView(title: "재치 등록하기", etcButton: Image.exit),
                   mainView: CheckRegisterView(infoView: infoView))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let registerSubject = PublishSubject<Void>()
    private let viewModel = CheckRegisterViewModel()
    
    override func initialize(){
        super.initialize()
        setDelegate()
        addButtonTarget()
        bindingRegisterData()
    }
    
    private func setDelegate(){
        mainView.photoCollectionView.initializeDelegate(self)
    }
    
    private func addButtonTarget(){
        headerView.etcButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
                self?.exitButtonDidTap()
            }).disposed(by: disposeBag)
        
        mainView.registerBtn.rx.tap
            .subscribe(onNext: { [weak self] _ in
                self?.registerAlertWillShow()
            }).disposed(by: disposeBag)
    }
    
    private func bindingRegisterData(){
        mainView.infoFrame.do{
            $0.myProductCategoryTag
                .setCategoryTitle(categoryId: myProductInfo.category)
            $0.myProductNameLabel
                .text = myProductInfo.productName
        }
        mainView.infoFrame.myProductDetailView.do{
            $0.endDateFrame.setInfo(value: myProductInfo.endDate ?? "")
            $0.buyDateFrame.setInfo(value: myProductInfo.buyDate ?? "")
            $0.countFrame.setInfo(value: myProductInfo.count ?? "")
            $0.openFrame.setInfo(value: Register.ProductOpenState(rawValue: myProductInfo.isOpen)?.title ?? "")
        }
    }
    
    override func bind() {

        let commentObservable = bindTextView()
        
        let input = CheckRegisterViewModel.Input(myProductInfo: myProductInfo,
                                                 wantProductInfo: wantProductInfo,
                                                 comment: commentObservable,
                                                 registerButtonTap: registerSubject.asObservable())
        let output = viewModel.transform(input)
    }
    
    private final func bindTextView() -> Observable<String>{
        //TextView
        let text = mainView.addExplainTextView.rx.text.orEmpty
            .asObservable()
            .startWith(CheckRegisterView.placeholder)
//            .share()
        
        text
            .first()
            .subscribe({ [weak self] _ in
                self?.setTextColorEmptyMode()
            }).disposed(by: disposeBag)
        
        mainView.addExplainTextView.rx.didBeginEditing
            .withLatestFrom(text)
            .bind(onNext: { [weak self] startText in
                
                if(startText == CheckRegisterView.placeholder || startText.isEmpty){
                    self?.setTextEmpty()
                }
                self?.setTextColorEditingMode()
            }).disposed(by: disposeBag)
        
        mainView.addExplainTextView.rx.didEndEditing
            .withLatestFrom(text)
            .bind(onNext: { [weak self] endText in
                if(endText.isEmpty){
                    self?.setTextPlaceholder()
                    self?.setTextColorEmptyMode()
                }
            }).disposed(by: disposeBag)
        
        return text
    }
    
    private func setTextEmpty(){
        mainView.addExplainTextView.text = nil
    }
    
    private func setTextPlaceholder(){
        mainView.addExplainTextView.text = CheckRegisterView.placeholder
    }
    
    private func setTextColorEmptyMode(){
        mainView.addExplainTextView.textColor = .black20
    }
    
    private func setTextColorEditingMode(){
        mainView.addExplainTextView.textColor = .black85
    }

    //MARK: - Action
    
    @objc private func registerAlertWillShow(){
        let alert = Alert.Register.show(in: self)
        alert.completion = {
            self.registerSubject.onNext(Void())
        }
    }
    
    @objc private final func exitButtonDidTap(){
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        UIView.animate(withDuration: 0.3){
            self.view.window?.frame.origin.y = 0
        }
    }
}

//MARK: - CollectionView
extension CheckRegisterViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ImageRegisterCollectionViewCell.self)
        return cell
    }
}
