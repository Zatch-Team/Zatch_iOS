//
//  TypoDesignSystem.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/03.
//

import Foundation

enum FontType{
    case Bold
    case SemiBold
    case Medium
    case Regular
}

struct FontDescription {
    let font: FontType
    let size: CGFloat
}

struct LabelDescription {
    var kern: CGFloat? = nil
    let lineHeight: CGFloat
}

enum TypoStyle: Int, CaseIterable {
    
    case bold40     // 40pt / bold / 72
    case bold32     // 32pt / bold / 38.4
    case bold20     // 20pt / bold / 28
    case bold18     // 18pt / bold / 24
    case bold16     // 16pt / bold / 19.2
    case bold15     // 15pt / bold / 18
    case bold14     // 14pt / bold / 16.8
    case bold13     // 13pt / bold / 18.2
    case bold12     // 12pt / bold / 16.8
    
    case medium18     // 18pt / medium / 24
    case medium16     // 16pt / medium / 19.2
    case medium15_21     // 15pt / medium / 21
    case medium15_19     // 15pt / medium / 19.5
    case medium14     // 14pt / medium / 16.8
    case medium13_19     // 13pt / medium / 19.5
    case medium13_15     // 13pt / medium / 15.6
    case medium12     // 12pt / medium / 15.6
    case medium10     // 10pt / medium / 13
    
    
    case regular18     // 18pt / regular / 24
    case regular16     // 16pt / regular / 24
    case regular15     // 15pt / regular / 21
    case regular14_19     // 14pt / regular / 19.6
    case regular14_18     // 14pt / regular / 18.2
    case regular13     // 13pt / regular / 19.5
    case regular12     // 12pt / regular / 15.6
    
    case extrabold20     // 20pt / extrabold / 24 / 0.15
    case extrabold18     // 18pt / extrabold / 25.2
}

extension TypoStyle {
    private var fontDescription: FontDescription {
        switch self {
        case .bold40:       return FontDescription(font: .Bold, size: 40)
        case .bold32:       return FontDescription(font: .Bold, size: 32)
        case .bold20:       return FontDescription(font: .Bold, size: 20)
        case .bold18:       return FontDescription(font: .Bold, size: 18)
        case .bold16:       return FontDescription(font: .Bold, size: 16)
        case .bold15:       return FontDescription(font: .Bold, size: 15)
        case .bold14:       return FontDescription(font: .Bold, size: 14)
        case .bold13:       return FontDescription(font: .Bold, size: 13)
        case .bold12:       return FontDescription(font: .Bold, size: 12)
        
        case .medium18:     return FontDescription(font: .Medium, size: 18)
        case .medium16:     return FontDescription(font: .Medium, size: 16)
        case .medium15_21:  return FontDescription(font: .Medium, size: 15)
        case .medium15_19:  return FontDescription(font: .Medium, size: 15)
        case .medium14:     return FontDescription(font: .Medium, size: 14)
        case .medium13_19:  return FontDescription(font: .Medium, size: 13)
        case .medium13_15:  return FontDescription(font: .Medium, size: 13)
        case .medium12:     return FontDescription(font: .Medium, size: 12)
        case .medium10:     return FontDescription(font: .Medium, size: 10)
        
        
        case .regular18:    return FontDescription(font: .Regular, size: 18)
        case .regular16:    return FontDescription(font: .Regular, size: 16)
        case .regular15:    return FontDescription(font: .Regular, size: 15)
        case .regular14_19: return FontDescription(font: .Regular, size: 14)
        case .regular14_18: return FontDescription(font: .Regular, size: 14)
        case .regular13:    return FontDescription(font: .Regular, size: 13)
        case .regular12:    return FontDescription(font: .Regular, size: 12)
        
        case .extrabold20: return FontDescription(font: .Regular, size: 20)
        case .extrabold18: return FontDescription(font: .Regular, size: 18)
        }
    }
    
    public var labelDescription: LabelDescription {
        switch self {
        case .bold40:       return LabelDescription(lineHeight: 72)
        case .bold32:       return LabelDescription(lineHeight: 38.4)
        case .bold20:       return LabelDescription(lineHeight: 28)
        case .bold18:       return LabelDescription(lineHeight: 24)
        case .bold16:       return LabelDescription(lineHeight: 19.2)
        case .bold15:       return LabelDescription(lineHeight: 18)
        case .bold14:       return LabelDescription(lineHeight: 16.8)
        case .bold13:       return LabelDescription(lineHeight: 18.2)
        case .bold12:       return LabelDescription(lineHeight: 16.8)
        
        case .medium18:     return LabelDescription(lineHeight: 24)
        case .medium16:     return LabelDescription(lineHeight: 19.2)
        case .medium15_21:  return LabelDescription(lineHeight: 21)
        case .medium15_19:  return LabelDescription(lineHeight: 19.5)
        case .medium14:     return LabelDescription(lineHeight: 16.8)
        case .medium13_19:  return LabelDescription(lineHeight: 19.5)
        case .medium13_15:  return LabelDescription(lineHeight: 15.6)
        case .medium12:     return LabelDescription(lineHeight: 15.6)
        case .medium10:     return LabelDescription(lineHeight: 13)
        
        
        case .regular18:    return LabelDescription(lineHeight: 24)
        case .regular16:    return LabelDescription(lineHeight: 24)
        case .regular15:    return LabelDescription(lineHeight: 21)
        case .regular14_19: return LabelDescription(lineHeight: 19.6)
        case .regular14_18: return LabelDescription(lineHeight: 18.2)
        case .regular13:    return LabelDescription(lineHeight: 19.5)
        case .regular12:    return LabelDescription(lineHeight: 15.6)
        
        case .extrabold20: return LabelDescription(kern: 0.15 ,lineHeight: 24)
        case .extrabold18: return LabelDescription(lineHeight: 25.2)
        }
    }
}

extension TypoStyle {
    var font: UIFont {
        guard let font = UIFont(name: "Pretendard-\(fontDescription.font)", size: fontDescription.size) else {
            return UIFont()
        }
        return font
    }
}

extension UILabel {
    
    func setTypoStyle(font: UIFont, kernValue: Double, lineSpacing: CGFloat) {
        if let labelText = text, labelText.count > 0, let attributedText = self.attributedText {

            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.maximumLineHeight = lineSpacing
            paragraphStyle.minimumLineHeight = lineSpacing
            
            
             let attributedString = NSMutableAttributedString(attributedString: attributedText)
            
            attributedString.addAttributes([.font:font,
                                                .kern:kernValue,
                                                .paragraphStyle: paragraphStyle,
                                                .baselineOffset: (lineSpacing - font.lineHeight) / 4
            ], range: NSRange(location: 0,
                              length: attributedString.length))
            
            self.attributedText = attributedString
        }
    }
    
    func setTypoStyleWithSingleLine(typoStyle: TypoStyle) {
        
        if(self.text == nil){
            self.text = " "
        }
        
        var attributes: [NSAttributedString.Key: Any] = [.font : typoStyle.font]
        
        if let kernValue = typoStyle.labelDescription.kern {
            attributes[.kern] = kernValue
        }

        if let labelText = text, labelText.count > 0, let attributedText = self.attributedText {
            
             let attributedString = NSMutableAttributedString(attributedString: attributedText)
            
            attributedString.addAttributes(attributes,
                                           range: NSRange(location: 0,
                                                          length: attributedString.length))
            
            self.attributedText = attributedString
        }
    }
    
    func setTypoStyleWithMultiLine(typoStyle: TypoStyle) {
        
        if(self.text == nil){
            self.text = " "
        }
        
        let font = typoStyle.font
        let lineSpacing = typoStyle.labelDescription.lineHeight
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.maximumLineHeight = lineSpacing
        paragraphStyle.minimumLineHeight = lineSpacing
        
        var attributes: [NSAttributedString.Key: Any] = [.font : font,
                                                         .paragraphStyle: paragraphStyle,
                                                         .baselineOffset: (lineSpacing - font.lineHeight) / 4]
        
        if let kernValue = typoStyle.labelDescription.kern {
            attributes[.kern] = kernValue
        }

        if let labelText = text, labelText.count > 0, let attributedText = self.attributedText {
            
             let attributedString = NSMutableAttributedString(attributedString: attributedText)
            
            attributedString.addAttributes(attributes, range: NSRange(location: 0,
                              length: attributedString.length))
            
            self.attributedText = attributedString
        }
    }
}

extension UITextView{
    
    func setTypoStyleWithMultiLine(typoStyle: TypoStyle) {
        
        if(self.text == nil){
            self.text = " "
        }
        
        let font = typoStyle.font
        let lineSpacing = typoStyle.labelDescription.lineHeight
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.maximumLineHeight = lineSpacing
        paragraphStyle.minimumLineHeight = lineSpacing
        
        var attributes: [NSAttributedString.Key: Any] = [.font : font,
                                                         .paragraphStyle: paragraphStyle,
                                                         .baselineOffset: (lineSpacing - font.lineHeight) / 4]
        
        if let kernValue = typoStyle.labelDescription.kern {
            attributes[.kern] = kernValue
        }

        if let labelText = text, labelText.count > 0, let attributedText = self.attributedText {
            
             let attributedString = NSMutableAttributedString(attributedString: attributedText)
            
            attributedString.addAttributes(attributes, range: NSRange(location: 0,
                              length: attributedString.length))
            
            self.attributedText = attributedString
        }
    }
}
