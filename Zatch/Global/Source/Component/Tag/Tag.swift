//
//  Tag.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/11.
//

import Foundation

extension ZatchComponent{
    
    class PurlpleTag: Tag{
        
        init(configuration: ZatchComponent.Tag.TagType){
            super.init(color: .purple, configuration: configuration)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class YellowTag: Tag{
        
        init(configuration: ZatchComponent.Tag.TagType){
            super.init(color: .yellow, configuration: configuration)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class Tag: UILabel{
        
        var isSelected = false{
            didSet{
                isSelected ? setSelectState() : setNormalState()
            }
        }
        
        private let configuration: TagType
        private let colorType: TagColor
        
        init(color: TagColor, configuration: TagType){
            self.colorType = color
            self.configuration = configuration
            super.init(frame: .zero)
            initialize()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func drawText(in rect: CGRect) {
            let inset = configuration.padding.inset
            super.drawText(in: rect.inset(by: inset))
        }
        
        override var intrinsicContentSize: CGSize{
            let padding = configuration.padding
            var contentSize = super.intrinsicContentSize
            contentSize.height += padding.top + padding.bottom
            contentSize.width += padding.left + padding.right
            return contentSize
        }
        
        private func initialize(){
            style()
            layout()
            setNormalState()
        }
        
        private func style(){
            self.layer.cornerRadius = configuration.height / 2
            self.clipsToBounds = true
            self.setTypoStyleWithSingleLine(typoStyle: configuration.font)
        }
        
        private func layout(){
            self.snp.makeConstraints{
                $0.height.equalTo(configuration.height)
            }
        }
        
        private func setNormalState(){
            self.textColor = colorType.textColor
            self.backgroundColor = colorType.backgroundColor
        }
        
        private func setSelectState(){
            self.textColor = colorType.selectedTextColor
            self.backgroundColor = colorType.selectedBackgroundColor
        }
        
        func setTitle(_ title: String){
            self.text = title
        }
    }
}
