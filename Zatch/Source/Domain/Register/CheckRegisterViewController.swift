//
//  CheckRegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/11.
//

import UIKit

class CheckRegisterViewController: BaseViewController {
    
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
        //textview -> placeholder uitextview로 직접 만들어야 함
    let addExplainTextView = UITextView().then{
        $0.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 8
        
        $0.textContainerInset = UIEdgeInsets(top: 23, left: 17, bottom: 23, right: 25)
    }
    
    let registerBtn = PurpleButton().then{
        $0.setTitle("재치 등록", for: .normal)
    }

    override func viewDidLoad() {
        
        super.navigationTitle.text = "재치 등록하기"
        
        super.viewDidLoad()
        
        setInitView()
        setUpView()
        setUpConstraint()

    }
    
    @objc
    func exitBtnDidClicked(){
        self.navigationController?.popToRootViewController(animated: true)
    }

}

extension CheckRegisterViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageRegisterCollectionViewCell.cellIdentifier, for: indexPath)
        return cell
    }
}
