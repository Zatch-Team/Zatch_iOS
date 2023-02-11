//
//  RadioButtonView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/10.
//

import Foundation

extension ZatchComponent{
    
    class RadioButtonView: BaseView{
        
        var isSelected = false{
            didSet{
                radioButton.isSelected = isSelected
                self.tag = isSelected ? ViewTag.select : ViewTag.normal
            }
        }
        
        private let stackView = UIStackView().then{
            $0.isUserInteractionEnabled = true
            $0.spacing = 8
            $0.axis = .horizontal
        }
        
        private lazy var radioButton = UIButton().then{
            $0.isUserInteractionEnabled = false
            $0.setImage(Image.zatchUncheck, for: .normal)
            $0.setImage(Image.zatchCheck, for: .selected)
        }
        
        private let titleLabel = UILabel().then{
            $0.setTypoStyleWithSingleLine(typoStyle: .medium14)
            $0.textColor = .black85
        }
        
        override func hierarchy() {
            self.addSubview(stackView)
            stackView.addArrangedSubview(radioButton)
            stackView.addArrangedSubview(titleLabel)
        }
        
        override func layout() {
            stackView.snp.makeConstraints{
                $0.top.leading.trailing.bottom.equalToSuperview()
            }
            radioButton.snp.makeConstraints{
                $0.width.height.equalTo(24)
            }
        }
        
        func setTitle(_ title: String){
            titleLabel.text = title
        }
    }
}
