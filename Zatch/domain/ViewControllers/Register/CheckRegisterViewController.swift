//
//  CheckRegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/11.
//

import UIKit

class CheckRegisterViewController: BaseLeftTitleViewController {

    //MARK: - Action
    
    @objc
    func exitBtnDidClicked(){
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
    
//    func textViewDidBeginEditing(_ textView: UITextView) {
//
//        UIView.animate(withDuration: 0.3){
//            self.view.window?.frame.origin.y -= 200
//        }
//
//        if textView.text == self.placeHolder {
//            textView.text = nil
//            textView.textColor = .black85
//        }
//    }
//
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
//            textView.text = placeHolder
//            textView.textColor = .black20
//        }
//    }
}

//MARK: - CollectionView
//extension CheckRegisterViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageRegisterCollectionViewCell.cellIdentifier, for: indexPath)
//        return cell
//    }
//}
