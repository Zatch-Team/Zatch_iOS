//
//  ShareDetailTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/28.
//

import UIKit

class ShareDetailTableViewCell: BaseTableViewCell {
    
    static let cellIdentifier = "ShareDetailTableViewCell"
    
    //MARK: - UI
    let shareTag = PaddingLabel().then{
        $0.text = "나눔"
        $0.textColor = .zatchDeepYellow
        $0.backgroundColor = .yellow40
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.layer.cornerRadius = 20/2
        $0.clipsToBounds = true
    }

    let categoryTag = PaddingLabel().then{
        $0.text = "생활용품"
        $0.textColor = .zatchPurple
        $0.backgroundColor = .purple40
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.layer.cornerRadius = 20/2
        $0.clipsToBounds = true
    }
    
    let productLabel = UILabel().then{
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.text = "몰랑이 피규어"
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }
    
    //MARK: - LifeCycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstriant()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        self.baseView.snp.makeConstraints{
            $0.height.equalTo(100)
        }
        
        baseView.backgroundColor = .red
        
    }
    
    func setUpConstriant(){
        
    }
}
