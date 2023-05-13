//
//  Tag.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/16.
//

import Foundation

extension ZatchComponent{
    
    class Tag: PaddingLabel{
        
        private let configuration: ZatchComponent.TagConfiguration
        let color: ZatchComponent.TagColor
        
        init(color: ZatchComponent.TagColor, configuration: ZatchComponent.TagConfiguration){
            self.color = color
            self.configuration = configuration
            super.init(padding: configuration.padding)
            initialize()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        static func filled(color: ZatchComponent.TagColor, configuration: ZatchComponent.TagConfiguration) -> FilledTag{
            return FilledTag(color: color, configuration: configuration)
        }
        
        static func stroke(color: ZatchComponent.TagColor, configuration: ZatchComponent.TagConfiguration) -> StrokeTag{
            return StrokeTag(color: color, configuration: configuration)
        }
        
        func initialize(){
            style()
            layout()
        }
        
        private func style(){
            layer.cornerRadius = configuration.height / 2
            clipsToBounds = true
            setTypoStyleWithSingleLine(typoStyle: configuration.font)
        }
        
        private func layout(){
            self.snp.makeConstraints{
                $0.height.equalTo(configuration.height)
            }
        }
        
        func setTitle(_ title: String){
            text = title
        }
        
        func setCategoryTitle(categoryId: Int?){
            if let categoryId = categoryId {
                let category = ServiceType.Zatch.getCategoryFromCategories(at: categoryId)
                text = category.title
            }
        }
    }
}
