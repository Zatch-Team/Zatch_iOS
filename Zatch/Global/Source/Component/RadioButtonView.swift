//
//  RadioButtonView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/10.
//

import Foundation

extension ZatchComponent{
    
    struct RadioConfiguration{
        let typo: TypoStyle
        let imageSize: CGFloat
    }
    
    class RadioButtonView: BaseView{
        
        var isSelected = false{
            didSet{
                radioButton.isSelected = isSelected
//                self.tag = isSelected ? ViewTag.select : ViewTag.normal
            }
        }
        
        private let configuration: RadioConfiguration
        
        convenience init(){
            self.init(configuration: RadioConfiguration(typo: .medium14, imageSize: 24), tag: 0)
        }
        
        init(configuration: RadioConfiguration, tag: Int){
            self.configuration = configuration
            super.init(frame: .zero)
            self.radioButton.tag = tag
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private let stackView = UIStackView().then{
            $0.isUserInteractionEnabled = true
            $0.spacing = 8
            $0.axis = .horizontal
            $0.alignment = .center
        }
        
        lazy var radioButton = UIButton().then{
//            $0.isUserInteractionEnabled = false
            $0.setImage(Image.zatchUncheck, for: .normal)
            $0.setImage(Image.zatchCheck, for: .selected)
        }
        
        private lazy var titleLabel = UILabel().then{
            $0.setTypoStyleWithSingleLine(typoStyle: configuration.typo)
            $0.textColor = .black85
        }
        
        override func hierarchy() {
            addSubview(stackView)
            stackView.addArrangedSubview(radioButton)
            stackView.addArrangedSubview(titleLabel)
        }
        
        override func layout() {
            stackView.snp.makeConstraints{
                $0.top.leading.trailing.bottom.equalToSuperview()
            }
            radioButton.snp.makeConstraints{
                $0.width.height.equalTo(configuration.imageSize)
            }
        }
        
        func setTitle(_ title: String){
            titleLabel.text = title
        }
    }
}
