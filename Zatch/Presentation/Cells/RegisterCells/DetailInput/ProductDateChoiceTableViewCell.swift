//
//  ProductDateChoiceTableViewCell.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/10.
//

import Foundation

class ProductDateChoiceTableViewCell: BaseTableViewCell {
    
    let backView = UIView()
    
    let titleLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black
    }
    
    let yearTextField = UILabel().then{
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black85
        $0.textAlignment = .center
    }
    let yearLabel = UILabel().then{
        $0.text = "년"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black
    }
    let yearBorderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    let monthTextField = UILabel().then{
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black85
        $0.textAlignment = .center
    }
    let monthLabel = UILabel().then{
        $0.text = "월"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black
    }
    let monthBorderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    let dateTextField = UILabel().then{
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black85
        $0.textAlignment = .center
    }
    let dateLabel = UILabel().then{
        $0.text = "일"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black
    }
    let dateBorderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    let checkButton = ZatchRoundCheck().then{
        $0.addTarget(self, action: #selector(checkButtonListener(_:)), for: .touchUpInside)
    }
    let checkButtonLabel = UILabel().then{
        $0.text = "확인 불가"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black
    }
    
    //stack view
    let stackView = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 13
        $0.distribution = .equalSpacing
    }
    let yearStack = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 4
    }
    let monthStack = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 4
    }
    let dateStack = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 4
    }
    
    var labelArray : [UILabel]!
    var textFieldArray: [UILabel]!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        labelArray = [titleLabel,yearLabel,monthLabel,dateLabel]
        textFieldArray = [yearTextField,monthTextField,dateTextField]

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    @objc func checkButtonListener(_ sender: ZatchRoundCheck){
        
        if(sender.isSelected){
            sender.isSelected = false
            stackView.isUserInteractionEnabled = true
            labelArray.forEach{ label in
                label.textColor = .black
            }
        }else{
            sender.isSelected = true
            labelArray.forEach{ label in
                label.textColor = .black20
            }
            textFieldArray.forEach{ label in
                label.text = ""
            }
        }
    }
    
    func setTitle(type: RegisterProductInfoTestViewController.ProductDate){
        titleLabel.text = type.rawValue
    }

}
