//
//  MyZatchView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/28.
//

import Foundation

class MyZatchView: BaseView{
    
    let filterStackView = UIStackView().then{
        $0.spacing = 4
    }
    let filterLabel = UILabel().then{
        $0.text = "전체보기"
    }
    let filterButton = UIButton().then{
        $0.setTitle("전체보기", for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
        $0.titleLabel?.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.setTitleColor(.black85, for: .normal)
        
        $0.setImage(Image.arrowDown, for: .normal)
        $0.setImage(Image.arrowUp, for: .selected)
    }
    
    let zatchTableView = UITableView().then{
        $0.register(cellType: MyZatchTableViewCell.self)
    }
    
    lazy var floatingButton = UIButton().then{
        $0.backgroundColor = .zatchPurple
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 28
        
        $0.setImage(Image.floatingPlus, for: .normal)

        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.masksToBounds = false
        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
        $0.layer.shadowRadius = 5
        $0.layer.shadowOpacity = 0.3
    }
    
    override func hierarchy() {
        self.addSubview(filterStackView)
        self.addSubview(zatchTableView)
        self.addSubview(floatingButton)
        
        filterStackView.addArrangedSubview(filterLabel)
        filterStackView.addArrangedSubview(filterButton)
    }
    
    override func layout() {
        
        filterStackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        filterLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
        }
        
        filterButton.snp.makeConstraints{
            $0.width.height.equalTo(20)
        }
        
        zatchTableView.snp.makeConstraints{
            $0.top.equalTo(filterStackView.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        floatingButton.snp.makeConstraints{
            $0.width.height.equalTo(56)
            $0.bottom.equalToSuperview().offset(-13)
            $0.trailing.equalToSuperview().offset(-32)
        }
    }
}
