//
//  SearchZatchByRegister.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/07.
//

import UIKit

protocol SearchZatchByRegister{
    associatedtype TagType: ZatchComponent.Tag
    var tagLabel: TagType { get }
    func setTitle(title: String)
    static func getEstimatedSize(title: String) -> CGSize
}

extension SearchZatchByRegister where Self: BaseCollectionViewCell{
    
    func setTitle(title: String){
        tagLabel.setTitle(title)
    }
    
    static func getEstimatedSize(title: String) -> CGSize{
        let testLabel = ZatchComponent.PurlpleTag(configuration: .height31).then{
            $0.setTitle(title)
        }
        return testLabel.intrinsicContentSize
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
