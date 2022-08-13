//
//  PaddingLabel.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/13.
//

import Foundation

class PaddingLabel : UILabel{
    
    private var padding = UIEdgeInsets(top: 2.0, left: 8.0, bottom: 2.0, right: 8.0)

    convenience init(padding: UIEdgeInsets) {
        self.init()
        self.padding = padding
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
