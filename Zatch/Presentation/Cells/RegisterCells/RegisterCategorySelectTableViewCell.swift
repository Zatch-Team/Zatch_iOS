//
//  CategoryUIView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/13.
//

import UIKit

class RegisterCategorySelectTableViewCell: BaseTableViewCell {

    //MARK: - UI
    
    var isSubViewOpen = false{
        didSet{
            mainView.arrowImage.isSelected = isSubViewOpen
        }
    }
    private let mainView = RegisterCategorySelectView()
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(mainView)
    }
    
    override func layout() {
        super.layout()
        mainView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setDefaultTitle(_ title: String){
        mainView.categoryText.text = title
    }
    
    func setCategoryTitle(id: Int){
        mainView.categoryText.text = ServiceType.Zatch.getCategoryFromCategories(at: id).title
    }
}
