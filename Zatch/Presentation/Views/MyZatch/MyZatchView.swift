//
//  MyZatchView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/28.
//

import Foundation

class MyZatchView: BaseView{
    
    lazy var filterView = ZatchComponent.LettersAndArrowView().then{
        $0.setTitle("전체보기")
    }
    let zatchTableView = UITableView().then{
        $0.register(cellType: ZatchTableViewCell.self)
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
        self.addSubview(filterView)
        self.addSubview(zatchTableView)
        self.addSubview(floatingButton)
    }
    
    override func layout() {
        
        filterView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-16)
        }
        zatchTableView.snp.makeConstraints{
            $0.top.equalTo(filterView.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        floatingButton.snp.makeConstraints{
            $0.width.height.equalTo(56)
            $0.bottom.equalToSuperview().offset(-13)
            $0.trailing.equalToSuperview().offset(-32)
        }
    }
}
