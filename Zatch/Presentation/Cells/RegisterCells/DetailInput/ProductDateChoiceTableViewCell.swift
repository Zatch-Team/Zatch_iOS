//
//  ProductDateChoiceTableViewCell.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/10.
//

import Foundation

protocol ProductRegisterDelegate{
    func dateNotConfirmed(about type: Register.ProductDate)
}

final class ProductDateChoiceTableViewCell: BaseTableViewCell {
    
    var productDateType: Register.ProductDate!{
        didSet{
            titleLabel.text = productDateType.rawValue
        }
    }
    
    var isNotConfirmed: Bool{
        checkButton.isSelected
    }
    
    var delegate: ProductRegisterDelegate!
    
    private let backView = UIView()
    private let titleLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black
    }
    
    private let yearTextField = UILabel().then{
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black85
        $0.textAlignment = .center
    }
    private let yearLabel = UILabel().then{
        $0.text = "년"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black
    }
    private let yearBorderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    private let monthTextField = UILabel().then{
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black85
        $0.textAlignment = .center
    }
    private let monthLabel = UILabel().then{
        $0.text = "월"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black
    }
    private let monthBorderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    private let dateTextField = UILabel().then{
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black85
        $0.textAlignment = .center
    }
    private let dateLabel = UILabel().then{
        $0.text = "일"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black
    }
    private let dateBorderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    private let checkButton = ZatchRoundCheck().then{
        $0.addTarget(self, action: #selector(checkButtonListener(_:)), for: .touchUpInside)
    }
    private let checkButtonLabel = UILabel().then{
        $0.text = "확인 불가"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black
    }
    
    //stack view
    private let stackView = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 13
        $0.distribution = .equalSpacing
    }
    private let yearStack = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 4
    }
    private let monthStack = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 4
    }
    private let dateStack = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 4
    }
    
    private lazy var labelArray = [titleLabel,yearLabel,monthLabel,dateLabel]
    private lazy var textFieldArray = [yearTextField,monthTextField,dateTextField]
    
    override func hierarchy() {
        
        super.hierarchy()

        baseView.addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(yearStack)
        stackView.addArrangedSubview(monthStack)
        stackView.addArrangedSubview(dateStack)
        
        yearStack.addArrangedSubview(yearTextField)
        yearStack.addArrangedSubview(yearLabel)
        yearStack.addSubview(yearBorderLine)
        
        monthStack.addArrangedSubview(monthTextField)
        monthStack.addArrangedSubview(monthLabel)
        monthStack.addSubview(monthBorderLine)
        
        dateStack.addArrangedSubview(dateTextField)
        dateStack.addArrangedSubview(dateLabel)
        dateStack.addSubview(dateBorderLine)
        
        baseView.addSubview(checkButton)
        baseView.addSubview(checkButtonLabel)
    }
    
    override func layout() {
        
        baseView.snp.makeConstraints{
            $0.height.equalTo(73)
            $0.top.equalToSuperview().offset(4)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        
        stackView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(36)
            make.height.equalTo(17)
            make.top.equalToSuperview().offset(9)
        }
        
        yearTextField.snp.makeConstraints{ make in
            make.width.equalTo(64)
            make.height.equalToSuperview()
        }
        yearBorderLine.snp.makeConstraints{ make in
            make.width.equalTo(yearTextField)
            make.height.equalTo(1)
            make.bottom.equalTo(yearTextField.snp.bottom)
        }
        
        monthTextField.snp.makeConstraints{ make in
            make.width.equalTo(36)
            make.height.equalToSuperview()
        }
        monthBorderLine.snp.makeConstraints{ make in
            make.width.equalTo(monthTextField)
            make.height.equalTo(1)
            make.bottom.equalTo(monthTextField.snp.bottom)
        }
        
        dateTextField.snp.makeConstraints{ make in
            make.width.equalTo(36)
            make.height.equalToSuperview()
        }
        dateBorderLine.snp.makeConstraints{ make in
            make.width.equalTo(dateTextField)
            make.height.equalTo(1)
            make.bottom.equalTo(dateTextField.snp.bottom)
        }
        
        checkButton.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
            make.top.equalTo(stackView.snp.bottom).offset(23)
            make.trailing.equalTo(checkButtonLabel.snp.leading).offset(-6)
        }
        checkButtonLabel.snp.makeConstraints{ make in
            make.trailing.equalTo(dateLabel.snp.trailing)
            make.centerY.equalTo(checkButton)
        }
    }
    
    @objc private func checkButtonListener(_ sender: ZatchRoundCheck){
        sender.isSelected.toggle()
        sender.isSelected ? setNotConfirmedState() : setDateSelectedState()
    }
    
    private func setNotConfirmedState(){
        labelArray.forEach{ label in
            label.textColor = .black20
        }
        delegate.dateNotConfirmed(about: productDateType)
    }
    
    private func setDateSelectedState(){
        stackView.isUserInteractionEnabled = true
        labelArray.forEach{ label in
            label.textColor = .black
        }
    }
    
    func setDate(_ date: Register.DateString?){
        guard let date = date else {
            textFieldArray.forEach{ $0.text = "" }; return
        }
        yearTextField.text = date.year
        monthTextField.text = date.month
        dateTextField.text = date.date
    }

}
