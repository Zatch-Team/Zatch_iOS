//
//  SearchTextFieldView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/12.
//

import Foundation

extension ZatchComponent{
    
    class SearchTextFieldView: BaseView{
        
        let textField = UITextField().then{
            $0.font = UIFont.pretendard(size: 18, family: .Bold)
            $0.textAlignment = .center
        }
        private let searchIcon = UIImageView().then{
            $0.image = Image.search
        }
        private let borderLine = ZatchComponent.BorderLine(color: .black85, height: 2)
        
        override func hierarchy() {
            self.addSubview(textField)
            self.addSubview(searchIcon)
            self.addSubview(borderLine)
        }
        
        override func layout() {
            borderLine.snp.makeConstraints{
                $0.leading.equalToSuperview().offset(40)
                $0.trailing.equalToSuperview().offset(-40)
                $0.bottom.equalToSuperview().offset(-16)
            }
            searchIcon.snp.makeConstraints{
                $0.width.height.equalTo(28)
                $0.top.equalToSuperview().offset(12)
                $0.trailing.equalToSuperview().offset(-48)
                $0.bottom.equalToSuperview().offset(-24)
            }
            textField.snp.makeConstraints{
                $0.bottom.equalTo(borderLine.snp.top).offset(-10)
                $0.trailing.equalTo(searchIcon.snp.leading).offset(-10)
                $0.centerX.equalToSuperview()
            }
        }
    }
}
