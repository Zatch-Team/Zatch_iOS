//
//  CheckRegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/11.
//

import UIKit

class CheckRegisterViewController: BaseViewController {
    
    let titleView = TitleView().then{
        $0.titleLabel.text = "이렇게 재치를\n업로드해도 괜찮을까요?"
    }
    
    //photo
    let photoFrame = UIView()
    
    let photoTitle = UILabel().then{
        $0.text = "사진"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
    }
    
    var photoCollectionView : UICollectionView!
    
    //info
    let infoFrame = CheckRegisterZatchInfoView()
    
    //explain
    let addTitle = UILabel().then{
        $0.text = "추가 설명"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
    }
        //textview -> placeholder uitextview로 직접 만들어야 함
    let addExplainTextView = UITextView().then{
        $0.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 8
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

}
