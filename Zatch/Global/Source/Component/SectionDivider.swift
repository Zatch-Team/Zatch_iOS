//
//  SectionDivider.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/23.
//

import Foundation

extension ZatchComponent{
    
    class SectionDivider: BaseView{
        
        private let borderLine = BorderLine(color: .black10, height: 1)
        private let sectionView = BorderLine(color: .black5, height: 8)
        
        init(){
            super.init(frame: .zero)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func hierarchy() {
            self.addSubview(sectionView)
            self.addSubview(borderLine)
        }
        
        override func layout() {
            borderLine.snp.makeConstraints{
                $0.top.leading.trailing.equalToSuperview()
            }
            sectionView.snp.makeConstraints{
                $0.top.leading.trailing.bottom.equalToSuperview()
            }
        }
    }
}
