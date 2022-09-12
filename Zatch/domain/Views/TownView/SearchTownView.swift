//
//  TownSearchView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/12.
//

import UIKit

class SearchTownView: UIView {
    
    let titleLabel = UILabel().then{
        $0.text = "나의 위치는"
        $0.font = UIFont.rixYeoljeongdo(size: 24)
        $0.textColor = UIColor(red: 38/255, green: 38/255, blue: 38/255, alpha: 1)
    }
    
    let searchTextField = UITextField().then{
        $0.placeholder = "이름(동,면,읍)으로 검색"
    }
    
    let myTownTitle = UILabel().then{
        $0.text = "우리 동네"
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.textColor = .black85
    }
    
    var myTownCollectionView: UICollectionView!
    
    lazy var moveSettingBtn = Purple52Button(title: "내 위치 설정하기")

    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        
        setInitSetting()
        setUpView()
        setUpConstriant()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setInitSetting(){
        myTownCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
            let flowLayout = LeftAlignCollectionViewFlowLayout()
            $0.collectionViewLayout = flowLayout
        }
    }
    
    func setUpView(){
        self.addSubview(titleLabel)
        self.addSubview(searchTextField)
        self.addSubview(myTownTitle)
        self.addSubview(myTownCollectionView)
        self.addSubview(moveSettingBtn)
    }
    
    func setUpConstriant(){
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(251)
            $0.leading.equalToSuperview().offset(20)
        }
        
        searchTextField.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-46)
        }
        
        myTownTitle.snp.makeConstraints{
            $0.top.equalTo(searchTextField.snp.bottom).offset(64)
            $0.leading.equalToSuperview().offset(20)
        }
        
        myTownCollectionView.snp.makeConstraints{
            $0.top.equalTo(myTownTitle.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-40)
        }
        
        moveSettingBtn.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(31)
            $0.trailing.equalToSuperview().offset(-31)
            $0.bottom.equalToSuperview().offset(-86)
        }
    }
}
