//
//  BorderLine.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/12.
//

import Foundation

extension ZatchComponent{
    
    class BorderLine: BaseView{
        
        private let height: CGFloat
        private let color: UIColor
        
        init(color: UIColor, height: CGFloat){
            self.color = color
            self.height = height
            super.init(frame: .zero)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func style() {
            self.backgroundColor = color
        }
        
        override func layout() {
            self.snp.makeConstraints{
                $0.height.equalTo(height)
            }
        }
    }
}
