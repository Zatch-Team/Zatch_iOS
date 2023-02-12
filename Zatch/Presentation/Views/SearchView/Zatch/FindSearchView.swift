//
//  FindSearchView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/29.
//

import UIKit

class FindSearchView: BaseView {
    
    //MARK: - UI
    let titleView = TopTitleView(title: "무엇을 찾고 있나요?")
    
    //
    let exchangeFrame = UIView()
    
    let myLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.textColor = .black85
        $0.numberOfLines = 1
        $0.textAlignment = .center
    }
    
    let exchangeImage = UIImageView().then{
        $0.image = Image.exchangeVertical
    }
    
    let wantTextField = UITextField().then{
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.textColor = .black85
        $0.textAlignment = .center
    }
    
    let textFieldBorderLine = UIView().then{
        $0.backgroundColor = .black85
    }
    
    let searchImage = UIImageView().then{
        $0.image = Image.search
    }
    
    //
    let subTitle1 = UILabel().then{
        $0.text = "가장 인기있는 재치"
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 15, family: .Bold)
    }
    
    let firstCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
        
        let flexLayout = UICollectionViewFlowLayout()
        flexLayout.scrollDirection = .horizontal
        flexLayout.minimumInteritemSpacing = 8
        
        $0.collectionViewLayout = flexLayout
        
//        $0.register(FindSearchTagCollectionViewCell.self, forCellWithReuseIdentifier: FindSearchTagCollectionViewCell.cellIdentifier)
    }
    
    let subTitle2 = UILabel().then{
        $0.text = "내가 찾는 재치"
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 15, family: .Bold)
    }
    
    let secondCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
        
        let flexLayout = UICollectionViewFlowLayout()
        flexLayout.scrollDirection = .horizontal
        flexLayout.minimumInteritemSpacing = 8
        
        $0.collectionViewLayout = flexLayout
        
//        $0.register(FindSearchTagCollectionViewCell.self, forCellWithReuseIdentifier: FindSearchTagCollectionViewCell.cellIdentifier)
    }
    
    let nextButton = Purple36Button(title: "검색하기")

    override func hierarchy() {
        
        self.addSubview(titleView)
        
        self.addSubview(exchangeFrame)
        exchangeFrame.addSubview(myLabel)
        exchangeFrame.addSubview(exchangeImage)
        exchangeFrame.addSubview(wantTextField)
        exchangeFrame.addSubview(textFieldBorderLine)
        exchangeFrame.addSubview(searchImage)
        
        self.addSubview(subTitle1)
        self.addSubview(firstCollectionView)
        
        self.addSubview(subTitle2)
        self.addSubview(secondCollectionView)
        self.addSubview(nextButton)
    }
    
    //뷰 제약조건 설정
    override func layout() {
        
        titleView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        exchangeFrame.snp.makeConstraints{ make in
            make.top.equalTo(titleView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(170)
        }
        
        myLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(18)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(20)
        }
        
        exchangeImage.snp.makeConstraints{ make in
            make.top.equalTo(myLabel.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        wantTextField.snp.makeConstraints{ make in
            make.top.equalTo(exchangeImage.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(20)
        }
        
        searchImage.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
            make.bottom.equalTo(textFieldBorderLine.snp.top).offset(-8)
            make.trailing.equalToSuperview().offset(-48)
            make.top.equalTo(wantTextField)
        }
        
        textFieldBorderLine.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.height.equalTo(2)
        }
        
        subTitle1.snp.makeConstraints{ make in
            make.top.equalTo(exchangeFrame.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(24)
        }
        
        firstCollectionView.snp.makeConstraints{ make in
            make.top.equalTo(subTitle1.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview()
            make.height.equalTo(28)
        }
        
        subTitle2.snp.makeConstraints{ make in
            make.top.equalTo(firstCollectionView.snp.bottom).offset(28)
            make.left.equalToSuperview().offset(24)
        }
        
        secondCollectionView.snp.makeConstraints{ make in
            make.top.equalTo(subTitle2.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview()
            make.height.equalTo(28)
        }
        
        nextButton.snp.makeConstraints{ make in
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-54)
            make.leading.equalToSuperview().offset(74)
            make.trailing.equalToSuperview().offset(-74)
            make.height.equalTo(36)
        }
    }
}
