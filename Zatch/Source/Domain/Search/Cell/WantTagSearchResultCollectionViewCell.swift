//
//  WantTagSearchResultCollectionViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/07.
//

import UIKit

class WantTagSearchResultCollectionViewCell: ResultSearchTagCollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUpValue()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpValue(){
        super.textColor = .zatchPurple
        super.unselectBackgroundColor = .purple40
        super.selectBackgroundColor = .zatchPurple
    }
}
