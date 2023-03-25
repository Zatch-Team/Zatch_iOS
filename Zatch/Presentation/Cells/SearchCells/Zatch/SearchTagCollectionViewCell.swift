//
//  SearchSelectCollectionViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/05.
//

import UIKit

class SearchTagCollectionViewCell: BaseCollectionViewCell, TagCollectionViewCell{
    
    static let height: CGFloat = 32
    static let padding: ZatchComponent.Padding = ZatchComponent.Padding(left: 14, right: 14, top: 6, bottom: 6)

    var isSelectState: Bool = false{
        didSet{
            isSelectState ? setSelectState() : setDeselectState()
        }
    }
    
    let tagLabel = PaddingLabel(padding: SearchTagCollectionViewCell.padding)
    
    override func style() {
        setTagLabelStyle()
        setDeselectState()
    }
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(tagLabel)
    }
    
    override func layout() {
        super.layout()
        setTagLayout()
    }
    
    static func estimatedSize(of title: String) -> CGSize{
        
        let testLabel = PaddingLabel(padding: SearchTagCollectionViewCell.padding).then{
            $0.text = title
            $0.snp.makeConstraints{
                $0.height.equalTo(SearchTagCollectionViewCell.height)
            }
        }
        
        let boldSize = testLabel.then{
            $0.setTypoStyleWithSingleLine(typoStyle: .bold15) }.intrinsicContentSize
        let mediumSize = testLabel.then{
            $0.setTypoStyleWithSingleLine(typoStyle: .medium15_19) }.intrinsicContentSize
        
        return CGSize(width: max(boldSize.width, mediumSize.width),
                      height: SearchTagCollectionViewCell.height)
    }
    
    private func setSelectState(){
        tagLabel.textColor = .zatchYellow
        tagLabel.layer.borderColor = UIColor.zatchYellow.cgColor
        tagLabel.layer.borderWidth = 1.5
        tagLabel.setTypoStyleWithSingleLine(typoStyle: .bold15)
    }
    
    private func setDeselectState(){
        tagLabel.textColor = .black45
        tagLabel.layer.borderColor = UIColor.black45.cgColor
        tagLabel.layer.borderWidth = 1
        tagLabel.setTypoStyleWithSingleLine(typoStyle: .medium15_19)
    }
}
