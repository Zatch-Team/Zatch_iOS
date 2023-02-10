//
//  LettersAndArrowView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/08.
//

import Foundation

extension ZatchComponent{
    
    class LettersAndArrowView: BaseView{
        
        var isSelected = false{
            didSet{
                arrowImage.image = isSelected ? Image.arrowUp : Image.arrowDown
            }
        }
        
        private let stackView = UIStackView().then{
            $0.spacing = 4
            $0.axis = .horizontal
        }
        private let label = UILabel().then{
            $0.setTypoStyleWithSingleLine(typoStyle: .medium16)
            $0.textColor = .black85
        }
        private let arrowImage = UIImageView().then{
            $0.image = Image.arrowDown
        }
        
        override func hierarchy() {
            self.addSubview(stackView)
            stackView.addArrangedSubview(label)
            stackView.addArrangedSubview(arrowImage)
        }
        
        override func layout() {
            stackView.snp.makeConstraints{
                $0.top.leading.trailing.bottom.equalToSuperview()
            }
            arrowImage.snp.makeConstraints{
                $0.width.height.equalTo(20)
                $0.top.bottom.trailing.equalToSuperview()
            }
        }
        
        func setTitle(_ title: String){
            label.text = title
        }
    }
}
