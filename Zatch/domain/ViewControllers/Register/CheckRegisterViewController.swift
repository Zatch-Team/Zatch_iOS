//
//  CheckRegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/11.
//

import UIKit

class CheckRegisterViewController: BaseLeftTitleViewController {
    
    //MARK: - Properties
    
    let placeHolder = "추가 설명이 필요하다면 여기에 적어주세요."
    
    //MARK: - UI
    
    lazy var exitBtn = UIButton().then{
        $0.setImage(UIImage(named: "exit"), for: .normal)
        $0.addTarget(self, action: #selector(exitBtnDidClicked), for: .touchUpInside)
    }
    
    let titleView = TitleView().then{
        $0.titleLabel.text = "이렇게 재치를\n업로드해도 괜찮을까요?"
    }
    
    let photoFrame = UIView()
    
    let photoTitle = UILabel().then{
        $0.text = "사진"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
    }
    
    var photoCollectionView : UICollectionView!
    
    let infoFrame = CheckRegisterZatchInfoView()
    
    let addTitle = UILabel().then{
        $0.text = "추가 설명"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
    }

    var addExplainTextView : UITextView!
    
    let registerBtn = Purple36Button(title: "재치 등록").then{
        $0.setTitle("재치 등록", for: .normal)
    }

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        
        super.navigationTitle.text = "재치 등록하기"
        
        super.viewDidLoad()
        
        setInitView()
        setUpView()
        setUpConstraint()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        UIView.animate(withDuration: 0.3){
            self.view.window?.frame.origin.y = 0
        }
    }
    
    //MARK: - Action
    
    @objc
    func exitBtnDidClicked(){
        self.navigationController?.popToRootViewController(animated: true)
    }

}

//MARK: - TextView
extension CheckRegisterViewController: UITextViewDelegate{
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        UIView.animate(withDuration: 0.3){
            self.view.window?.frame.origin.y -= 200
        }
        
        if textView.text == self.placeHolder {
            textView.text = nil
            textView.textColor = .black85
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = placeHolder
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
