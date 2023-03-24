//
//  TagCollectionViewCell.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/24.
//

import Foundation

protocol TagCollectionViewCell{
    static var height: CGFloat { get }
    static var padding: ZatchComponent.Padding { get }
    static func estimatedSize(of title: String) -> CGSize
    var tagLabel: PaddingLabel { get }
    func setTitle(_ title: String)
}

extension TagCollectionViewCell where Self: BaseCollectionViewCell{
    
    func setTagLabelStyle(){
        tagLabel.do{
            $0.numberOfLines = 1
            $0.clipsToBounds = true
            $0.layer.cornerRadius = Self.height/2
        }
    }
    
    func setTitle(_ title: String){
        tagLabel.text = title
    }
    
    func setTagLayout(){
        tagLabel.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(Self.height)
        }
    }
}
