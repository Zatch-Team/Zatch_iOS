//
//  MyTownTagCollectionViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/12.
//

import UIKit

class MyTownTagCollectionViewCell: BaseCollectionViewCell, TagCollectionViewCell {
    
    static let height: CGFloat = 28
    static let padding = ZatchComponent.Padding(left: 12, right: 28, top: 4.5, bottom: 4.5)
    
    let tagLabel = PaddingLabel(padding: MyTownTagCollectionViewCell.padding).then{
        $0.backgroundColor = .yellow40
        $0.textColor = .zatchDeepYellow
        $0.setTypoStyleWithSingleLine(typoStyle: .medium16)
    }
    
    lazy var deleteBtn = UIButton().then{
        $0.setImage(Image.exit.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.tintColor = .zatchDeepYellow
    }
    
    override func style() {
        setTagLabelStyle()
    }
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(tagLabel)
        tagLabel.addSubview(deleteBtn)
    }
    
    override func layout() {
        super.layout()
        setTagLayout()
        deleteBtn.snp.makeConstraints{
            $0.width.height.equalTo(20)
            $0.leading.equalTo(tagLabel.snp.trailing).offset(4)
            $0.trailing.equalToSuperview().inset(4)
            $0.centerY.equalToSuperview()
        }
    }
    
    static func estimatedSize(of title: String) -> CGSize {
        let testLabel = PaddingLabel(padding: MyTownTagCollectionViewCell.padding).then{
            $0.text = title
            $0.snp.makeConstraints{
                $0.height.equalTo(MyTownTagCollectionViewCell.height)
            }
        }
        return CGSize(width: testLabel.intrinsicContentSize.width,
                      height: MyTownTagCollectionViewCell.height)
    }
}
