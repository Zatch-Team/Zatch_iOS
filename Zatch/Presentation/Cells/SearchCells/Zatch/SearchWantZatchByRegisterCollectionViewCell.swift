//
//  SearchWantZatchByRegisterCollectionViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/07.
//

import UIKit

class SearchWantZatchByRegisterCollectionViewCell: BaseCollectionViewCell, SearchZatchByRegister {
    
    var isSelectedState: Bool = false{
        didSet{
            isSelectedState ? setSelectState() : setDeselectState()
        }
    }
    
    let tagLabel = ZatchComponent.PurlpleTag(configuration: .height31)
    
    override func hierarchy() {
        super.hierarchy()
        tagLabelHierarchy()
    }
    
    override func layout() {
        super.layout()
        tagLabelLayout()
    }
    
}
