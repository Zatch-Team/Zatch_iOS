//
//  CategoryUIView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/13.
//

import UIKit

class CategorySelectTableViewCell: BaseTableViewCell {
    
    //MARK: - Properties
    
    static let cellIdentifier = "categoryViewCell"
    
    //MARK: - UI
    
    let categoryFrame = UIView()
    
    let boundaryLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    let categoryText = UILabel().then{
        $0.text = "카테고리 선택"
        $0.font = UIFont.pretendard(family: .Medium)
    }
    
    lazy var arrowImage = UIButton().then{
        $0.setImage(UIImage(named: "arrow_down"), for: .normal)
        $0.setImage(UIImage(named: "arrow_up"), for: .selected)
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
        
        baseView.addSubview(categoryFrame)
        
        categoryFrame.addSubview(boundaryLine)
        categoryFrame.addSubview(categoryText)
        categoryFrame.addSubview(arrowImage)
    }
    
    func setUpConstriant(){

        categoryFrame.snp.makeConstraints{ make in
            make.leading.trailing.top.bottom.equalToSuperview()
            make.height.equalTo(41)
        }
        
        boundaryLine.snp.makeConstraints{ make in
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        categoryText.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(36)
        }
        
        arrowImage.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalToSuperview().offset(12)
        }
    }
}
