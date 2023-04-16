//
//  CheckRegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/11.
//

import UIKit

class CheckRegisterViewController: BaseViewController<LeftNavigationEtcButtonHeaderView, CheckRegisterView> {
    
    let myProductInfo: RegisterFirstInformationDTO
    
    init(myProductInfo: RegisterFirstInformationDTO, infoView: MyProductInformationView){
        self.myProductInfo = myProductInfo
        super.init(headerView: LeftNavigationEtcButtonHeaderView(title: "재치 등록하기", etcButton: Image.exit),
                   mainView: CheckRegisterView(infoView: infoView))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize(){
        
        super.initialize()
        setDelegate()
        addButtonTarget()
        bindingRegisterData()
        bindTextView()
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

    //MARK: - Action
    
    @objc private func registerAlertWillShow(){
        let alert = Alert.Register.show(in: self)
        alert.completion = {
            print("등록 완료 버튼 눌림")
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

//MARK: - TextView
extension CheckRegisterViewController: UITextViewDelegate{
    
    func textViewDidBeginEditing(_ textView: UITextView) {

        UIView.animate(withDuration: 0.3){
            self.view.window?.frame.origin.y -= 200
        }

        if textView.text == CheckRegisterView.placeHolder {
            textView.text = nil
            textView.textColor = .black85
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = CheckRegisterView.placeHolder
            textView.textColor = .black20
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
