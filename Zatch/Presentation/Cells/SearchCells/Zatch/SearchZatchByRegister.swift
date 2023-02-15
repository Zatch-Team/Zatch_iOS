//
//  SearchZatchByRegister.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/07.
//

import UIKit

protocol SearchZatchByRegister{
    associatedtype TagType: ZatchComponent.Tag
    var isSelectedState: Bool { get set }
    var tagLabel: TagType { get }
}

extension SearchZatchByRegister where Self: BaseCollectionViewCell{
    
    static func getEstimatedSize(title: String) -> CGSize{
        let testLabel = ZatchComponent.PurlpleTag(configuration: .height31).then{
            $0.setTitle(title)
        }
        return testLabel.intrinsicContentSize
    }
    
    func setTitle(title: String){
        tagLabel.setTitle(title)
    }
    
    func setSelectState(){
        tagLabel.isSelected = true
    }
    
    func setDeselectState(){
        tagLabel.isSelected = false
    }
    
    func tagLabelHierarchy(){
        baseView.addSubview(tagLabel)
    }
    
    func tagLabelLayout(){
        tagLabel.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
