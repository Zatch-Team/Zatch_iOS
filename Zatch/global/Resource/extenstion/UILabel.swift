//
//  UILabel.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/09.
//

import UIKit

extension UILabel {

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
    // MARK: 특정 문자열의 색깔만 변경
    func asColor(targetString: String, color: UIColor) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetString)
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        attributedText = attributedString
    }
}
