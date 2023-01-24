//
//  CheckRegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/11.
//

import UIKit

class CheckRegisterViewController: BaseLeftTitleViewController {
    
    let mainView = CheckRegisterView().then{
        $0.registerBtn.addTarget(self, action: #selector(registerBtnDidClicked), for: .touchUpInside)
    }
    
    //MARK: - LifeCycle
    
    override init(){
        super.init(rightButton: Image.exit)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Override
    
    override func style(){
        
        super.style()
        
        self.navigationTitle.text = "재치 등록하기"
//        self.addRightTopBtn(image: Image.exit)
    }
    
    override func initialize(){
        
        super.initialize()
        
        mainView.photoCollectionView.delegate = self
        mainView.photoCollectionView.dataSource = self
        
        mainView.addExplainTextView.delegate = self
    }
    
    override func layout(){
        
        super.layout()
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(Const.Offset.TOP_OFFSET)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }

    }

    //MARK: - Action
    
    @objc func registerBtnDidClicked(){
        let alert = Alert.Register.generateAlert().show(in: self)
        
        alert.confirmHandler = {
            print("등록 완료 버튼 눌림")
        }
    }
    
    override func rightPositionBtnDidClicked(){
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageRegisterCollectionViewCell.cellIdentifier, for: indexPath)
        return cell
    }
}