//
//  FindSearchView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/29.
//

import UIKit

class FindWantZatchSearchView: BaseView {
    
    //MARK: - UI
    private let titleView = TopTitleView(title: "무엇을 찾고 있나요?")
    
    private let searchFrame = UIView()
    let myProductNameLabel = UILabel().then{
        $0.setTypoStyleWithSingleLine(typoStyle: .bold18)
        $0.textColor = .black85
        $0.numberOfLines = 1
        $0.textAlignment = .center
    }
    private let exchangeImage = UIImageView().then{
        $0.image = Image.exchangeVertical
    }
    let searchTextFieldFrame = ZatchComponent.SearchTextFieldView()
    
    private let subTitle1 = UILabel().then{
        $0.text = "가장 인기있는 재치"
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 15, family: .Bold)
    }
    
    let firstCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
        
        let flexLayout = UICollectionViewFlowLayout()
        flexLayout.scrollDirection = .horizontal
        flexLayout.minimumInteritemSpacing = 8
        
        $0.collectionViewLayout = flexLayout
        $0.register(cellType: SearchTagCollectionViewCell.self)
    }
    
    private let subTitle2 = UILabel().then{
        $0.text = "내가 찾는 재치"
        $0.textColor = .black85
        $0.setTypoStyleWithSingleLine(typoStyle: .bold18)
    }
    let secondCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
        
        let flexLayout = UICollectionViewFlowLayout()
        flexLayout.scrollDirection = .horizontal
        flexLayout.minimumInteritemSpacing = 8
        
        $0.collectionViewLayout = flexLayout
        $0.register(cellType: SearchTagCollectionViewCell.self)
    }
    
    let nextButton = ZatchComponent.FillButton(color: .purple, title: "검색하기", configuration: .height48)

    override func hierarchy() {
        self.addSubview(titleView)
        self.addSubview(searchFrame)
        self.addSubview(subTitle1)
        self.addSubview(firstCollectionView)
        self.addSubview(subTitle2)
        self.addSubview(secondCollectionView)
        self.addSubview(nextButton)
        
        searchFrame.addSubview(myProductNameLabel)
        searchFrame.addSubview(exchangeImage)
        searchFrame.addSubview(searchTextFieldFrame)
    }
    
    override func layout() {
        
        titleView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        searchFrame.snp.makeConstraints{ make in
            make.top.equalTo(titleView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(182)
        }
        myProductNameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(16)
            $0.centerX.equalToSuperview()
        }
        exchangeImage.snp.makeConstraints{
            $0.top.equalTo(myProductNameLabel.snp.bottom).offset(28)
            $0.width.height.equalTo(24)
            $0.centerX.equalToSuperview()
        }
        searchTextFieldFrame.snp.makeConstraints{
            $0.top.equalTo(exchangeImage.snp.bottom).offset(14)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        subTitle1.snp.makeConstraints{
            $0.top.equalTo(searchFrame.snp.bottom).offset(36)
            $0.leading.equalToSuperview().offset(24)
        }
        
        firstCollectionView.snp.makeConstraints{
            $0.top.equalTo(subTitle1.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(SearchTagCollectionViewCell.height)
        }
        
        subTitle2.snp.makeConstraints{
            $0.top.equalTo(firstCollectionView.snp.bottom).offset(28)
            $0.left.equalToSuperview().offset(24)
        }
        
        secondCollectionView.snp.makeConstraints{
            $0.top.equalTo(subTitle2.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(SearchTagCollectionViewCell.height)
        }
        
        nextButton.snp.makeConstraints{
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-55)
            $0.leading.equalToSuperview().offset(nextButton.offset)
            $0.centerX.equalToSuperview()
        }
    }
}
