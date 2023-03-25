//
//  TownSearchView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/12.
//

import UIKit

class SearchTownView: BaseView {
    
    private let titleLabel = UILabel().then{
        $0.text = "나의 위치는"
        $0.font = UIFont.rixYeoljeongdo(size: 24)
        $0.textColor = UIColor(r: 38, g: 38, b: 38, alpha: 1)
    }
    
    let searchTextField = LocationSearchTextField()
    
    private let myTownTitle = UILabel().then{
        $0.text = "우리 동네"
        $0.setTypoStyleWithSingleLine(typoStyle: .bold18)
        $0.textColor = .black85
    }
    
    let myTownCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
        
        let flowLayout = LeftAlignCollectionViewFlowLayout().then{
            $0.minimumInteritemSpacing = 8
            $0.minimumLineSpacing = 16
        }

        $0.collectionViewLayout = flowLayout
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = false

        $0.register(MyTownTagCollectionViewCell.self, forCellWithReuseIdentifier: MyTownTagCollectionViewCell.cellIdentifier)
    }
    
    lazy var nextButton = Purple52Button(title: "내 위치 설정하기")
    
    override func hierarchy() {
        addSubview(titleLabel)
        addSubview(searchTextField)
        addSubview(myTownTitle)
        addSubview(myTownCollectionView)
        addSubview(nextButton)
    }
    
    override func layout() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(204-60)
            $0.leading.equalToSuperview().offset(20)
        }
        
        searchTextField.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        myTownTitle.snp.makeConstraints{
            $0.top.equalTo(searchTextField.snp.bottom).offset(60)
            $0.leading.equalToSuperview().offset(20)
        }
        
        myTownCollectionView.snp.makeConstraints{
            $0.top.equalTo(myTownTitle.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(30)
        }
        
        nextButton.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(31)
            $0.bottom.equalToSuperview().inset(86)
        }
    }
}
