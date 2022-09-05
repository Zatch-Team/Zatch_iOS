//
//  SearchCateogryButton.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/07.
//

import UIKit

class SearchCateogryDotButton: UIButton {
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.setImage(UIImage(named: "search_dot"), for: .normal)
        self.setImage(UIImage(named: "search_dot_checked"), for: .selected)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
