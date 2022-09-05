//
//  FindSearchTagCollectionViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/06.
//

import UIKit

class FindSearchTagCollectionViewCell: SearchTagCollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Action
    override func selectBtnIsTapped(){
        delegate?.newCellIsSelected(self)
    }
}
