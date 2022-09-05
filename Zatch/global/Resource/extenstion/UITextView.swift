//
//  UITextView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/11.
//

import Foundation

extension UITextView {
    
    func setTextWithLineHeight(lineHeight: CGFloat){
        if let text = text {
            let style = NSMutableParagraphStyle()
            style.maximumLineHeight = lineHeight
            style.minimumLineHeight = lineHeight
            style.lineSpacing = lineHeight/4
            
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: style,
            ]
            
            let attrString = NSMutableAttributedString(string: text,
                                      attributes: attributes)
            
            self.attributedText = attrString
        }
    }
    
}
