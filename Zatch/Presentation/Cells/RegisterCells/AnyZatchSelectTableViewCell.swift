//
//  AnyZatchSelectTableViewCell.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/13.
//

import Foundation
import RxGesture

class AnyZatchSelectTableViewCell: BaseTableViewCell{
    
    var delegate: RegisterSecondInfoDelegate!
    
    private lazy var selectedRadioButton: ZatchComponent.RadioButtonView = topRadioButtonFrame{
        willSet{
            selectedRadioButton.isSelected = false
        }
        didSet{
            selectedRadioButton.isSelected = true
        }
    }
    
    private let radioButtonFrame = UIStackView().then{
        $0.spacing = 16
        $0.axis = .vertical
    }
    
    private let topRadioButtonFrame = ZatchComponent.RadioButtonView().then{
        $0.tag = Register.WantZatch.anyZatch.rawValue
        $0.setTitle("다른 것도 괜찮아요!")
        $0.isSelected = true
    }
    
    private let belowRadioButtonFrame = ZatchComponent.RadioButtonView().then{
        $0.tag = Register.WantZatch.onlyRegister.rawValue
        $0.setTitle("이 것만 가능해요!")
    }
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(radioButtonFrame)
        radioButtonFrame.addArrangedSubview(topRadioButtonFrame)
        radioButtonFrame.addArrangedSubview(belowRadioButtonFrame)
    }
    
    override func layout() {
        super.layout()
        radioButtonFrame.snp.makeConstraints{
            $0.top.equalToSuperview().offset(36)
            $0.leading.equalToSuperview().offset(24)
            $0.bottom.equalToSuperview()
        }
    }
    
    override func initialize() {
        topRadioButtonFrame.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeSelectRadioButtonElement)))
        belowRadioButtonFrame.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeSelectRadioButtonElement)))
    }
    
    @objc private func changeSelectRadioButtonElement(recognizer: UITapGestureRecognizer){
        if let recognizer = recognizer.view as? ZatchComponent.RadioButtonView,
            let wantZatchType = Register.WantZatch(rawValue: recognizer.tag){
            selectedRadioButton = recognizer
            delegate.selectWantZatchType(wantZatchType)
        }
    }
}
