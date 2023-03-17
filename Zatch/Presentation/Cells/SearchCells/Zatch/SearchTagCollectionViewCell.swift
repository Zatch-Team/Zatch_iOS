//
//  SearchSelectCollectionViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/05.
//

import UIKit

class SearchTagCollectionViewCell: BaseCollectionViewCell{
    
    static let height = 32

    var isSelectState: Bool = false{
        didSet{
            isSelectState ? setSelectState() : setDeselectState()
        }
    }
    
    private let tagLabel = PaddingLabel(padding: ZatchComponent.Padding(left: 14, right: 14, top: 6, bottom: 6)).then{
        $0.numberOfLines = 1
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 32/2
    }
    
    override func style() {
        setDeselectState()
    }
    
    override func hierarchy() {
        super.hierarchy()
        self.baseView.addSubview(tagLabel)
    }
    
    override func layout() {
        super.layout()
        tagLabel.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(SearchTagCollectionViewCell.height)
        }
    }
    
    static func getEstimatedSize(title: String) -> CGSize{
        
        let testLabel = PaddingLabel(padding: ZatchComponent.Padding(left: 14, right: 14, top: 6, bottom: 6)).then{
            $0.text = title
            $0.snp.makeConstraints{
                $0.height.equalTo(SearchTagCollectionViewCell.height)
            }
        }
        
        let boldSize = testLabel.then{
            $0.setTypoStyleWithSingleLine(typoStyle: .bold15) }.intrinsicContentSize
        let mediumSize = testLabel.then{
            $0.setTypoStyleWithSingleLine(typoStyle: .medium15_19) }.intrinsicContentSize
        
        return boldSize.width > mediumSize.width ? boldSize : mediumSize
    }
    
    func setTitle(_ title: String){
        tagLabel.text = title
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
