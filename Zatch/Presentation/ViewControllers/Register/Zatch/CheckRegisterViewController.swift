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
        
        headerView.etcButton.addTarget(self, action: #selector(exitButtonDidClicked), for: .touchUpInside)
        
        mainView.photoCollectionView.delegate = self
        mainView.photoCollectionView.dataSource = self
        
        mainView.addExplainTextView.delegate = self
        
        mainView.registerBtn.addTarget(self, action: #selector(registerBtnDidClicked), for: .touchUpInside)
    }

    //MARK: - Action
    
    @objc func registerBtnDidClicked(){
        let alert = Alert.Register.show(in: self)
        alert.completion = {
            print("등록 완료 버튼 눌림")
        }
    }
    
    @objc func exitButtonDidClicked(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
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
