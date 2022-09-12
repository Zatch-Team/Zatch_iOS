//
//  MyTownTagCollectionViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/12.
//

import UIKit

class MyTownTagCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "MyTownTagCollectionViewCell"

    let yellowTagView = UIView().then{
        $0.backgroundColor = .yellow40
        $0.layer.cornerRadius = 28/2
    }
    
    let townLabel = UILabel().then{
        $0.textColor = .zatchDeepYellow
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
    }
    
    lazy var deleteBtn = UIButton().then{
        $0.setImage(UIImage(named: "exit")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.tintColor = .zatchDeepYellow
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func setUpView(){
        self.contentView.addSubview(yellowTagView)
        
        yellowTagView.addSubview(townLabel)
        yellowTagView.addSubview(deleteBtn)
    }
    
    func setUpConstraint(){
        
        yellowTagView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        townLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(12)
        }
        
        deleteBtn.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(20)
            $0.leading.equalTo(townLabel.snp.trailing).offset(4)
            $0.trailing.equalToSuperview().offset(-4)
        }
    }
}
