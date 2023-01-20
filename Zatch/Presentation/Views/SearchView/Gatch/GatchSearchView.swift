//
//  GatchSearchView.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/12.
//

import UIKit

//MARK: - GatchSearchHeaderView
class GatchSearchHeaderView: BaseView{
    let searchTextField = UITextField()
    lazy var searchButton = UIButton()
    lazy var alarmButton = UIButton()
}

//MARK: - GatchSearchMainView
class GatchSearchMainView: BaseView {
    
    let searchFilterStackView = UIStackView().then{
        $0.spacing = 20
        $0.axis = .horizontal
    }
    
    lazy var townSelectButton = UIButton().then{
        $0.setTitle("홍제동", for: .normal)
        $0.titleLabel?.setTypoStyleWithSingleLine(typoStyle: .medium14)
        $0.backgroundColor = .yellow40
    }
    
    let searchFilterCollectionView = UICollectionView().then{
        $0.backgroundColor = .red
    }
    let resultTableView = UITableView()

    override func hierarchy() {
        self.addSubview(searchFilterCollectionView)
        self.addSubview(resultTableView)
    }
    
    override func layout() {
        
        searchFilterStackView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview()
        }
        
        townSelectButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(4)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(townSelectButton.titleLabel!.snp.height).offset(11)
        }
        
        searchFilterCollectionView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(6)
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        resultTableView.snp.makeConstraints{
            $0.top.equalTo(searchFilterCollectionView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
