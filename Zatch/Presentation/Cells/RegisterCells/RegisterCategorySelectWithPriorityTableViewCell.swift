//
//  CategorySelectWithRankTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/10.
//

import UIKit

class RegisterCategorySelectWithPriorityTableViewCell: BaseTableViewCell {
    
    private let priorityTitle = UILabel().then{
        $0.setTypoStyleWithSingleLine(typoStyle: .medium14)
    }
    private let mainView = RegisterCategorySelectView()
    
    override func prepareForReuse() {
        priorityTitle.text = ""
        mainView.categoryText.text = ""
    }
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(priorityTitle)
        baseView.addSubview(mainView)
    }
    
    override func layout() {
        
        super.layout()
        
        baseView.snp.makeConstraints{
            $0.height.equalTo(88)
        }
        priorityTitle.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(36)
        }
        mainView.snp.makeConstraints{
            $0.top.equalTo(priorityTitle.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setPriorityTitle(section: Int){
        let priority = section + 1
        priorityTitle.text = "\(priority)순위"
    }
    
    func setCategoryTitle(id: Int?){
        let title = id == nil ? "카테고리 선택" : ServiceType.Zatch.getCategoryFromCategories(at: id!).title
        mainView.categoryText.text = title
    }
    
}
