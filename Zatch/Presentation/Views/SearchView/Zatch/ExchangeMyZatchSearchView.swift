//
//  MySearchView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/29.
//

import UIKit

class ExchangeMyZatchSearchView: BaseView {
    
    private let titleView = TopTitleView(title: "내가 교환할 재치를\n입력해주세요.")
    
    private let searchFrame = UIView()
    let searchTextFieldFrame = ZatchComponent.SearchTextFieldView()
    
    private let subTitleLabel = UILabel().then{
        $0.text = "나의 재치"
        $0.setTypoStyleWithSingleLine(typoStyle: .bold18)
    }
    
    lazy var nextButton = ZatchComponent.FillButton(color: .purple, title: "다음으로", configuration: .height48)
    lazy var skipButton = UIButton().then{
        $0.setTitle("건너뛰기", for: .normal)
        $0.setTitleColor(.black45, for: .normal)
        $0.titleLabel?.setTypoStyleWithSingleLine(typoStyle: .medium15_19)
    }
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
        let layout = LeftAlignCollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 4
        
        $0.collectionViewLayout = layout
        $0.register(cellType: SearchTagCollectionViewCell.self)
    }
    
    override func hierarchy() {
        self.addSubview(titleView)
        
        self.addSubview(searchFrame)
        searchFrame.addSubview(searchTextFieldFrame)
        
        self.addSubview(subTitleLabel)
        self.addSubview(collectionView)
        self.addSubview(nextButton)
        self.addSubview(skipButton)
    }
    
    override func layout() {
        
        titleView.snp.makeConstraints{ make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        searchFrame.snp.makeConstraints{
            $0.top.equalTo(titleView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(122)
        }
        searchTextFieldFrame.snp.makeConstraints{
            $0.top.equalToSuperview().offset(46)
            $0.leading.trailing.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints{
            $0.top.equalTo(searchFrame.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(24)
        }
        
        collectionView.snp.makeConstraints{
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(12)
            $0.bottom.equalTo(nextButton.snp.top).offset(-16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        nextButton.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(nextButton.offset)
            $0.trailing.equalToSuperview().offset(-nextButton.offset)
        }
        skipButton.snp.makeConstraints{
            $0.top.equalTo(nextButton.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-20)
        }
    }
}
