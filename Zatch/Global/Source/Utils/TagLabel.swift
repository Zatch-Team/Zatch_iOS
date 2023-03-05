//
//  TagLabel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/11.
//

import Foundation

class TagLabel: UILabel{
    
    private let padding: UIEdgeInsets
    
    init(padding: ZatchComponent.Padding){
        self.padding = padding.inset
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right
        return contentSize
    }
}
