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
    
    class Tag: TagLabel{
        
        var isDisabled = false{
            didSet{
                isDisabled ? setDisabledState() : setNormalState()
            }
        }
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
            super.init(padding: configuration.padding)
            initialize()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
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
            self.tag = ViewTag.normal
            self.textColor = colorType.textColor
            self.backgroundColor = colorType.backgroundColor
        }
        
        private func setDisabledState(){
            self.tag = ViewTag.deselect
            self.textColor = colorType.disabledTextColor
            self.backgroundColor = colorType.disabledBackgroundColor
        }
        
        private func setSelectState(){
            self.tag = ViewTag.select
            self.textColor = colorType.selectedTextColor
            self.backgroundColor = colorType.selectedBackgroundColor
        }
        
        func setTitle(_ title: String){
            self.text = title
        }
        
        func setCategoryTitle(categoryId: Int){
            let category = ServiceType.Zatch.getCategoryFromCategories(at: categoryId)
            self.text = category.title
        }
    }
}
