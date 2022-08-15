//
//  FirstRegisterTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/19.
//

import UIKit

class ProductQuantityUIView: BaseTableViewCell {
    
    static let cellIdentifier = "productQuantityCell"
    
    //MARK: - UIView
    let titleLabel = UILabel().then{
        $0.text = "수량"
        $0.font = UIFont.pretendard(family: .Medium)
    }
    
    let countTextField = UITextField()
    
    let textFieldBorderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    let unitLabel = UILabel().then{
        $0.text = "(단위)"
        $0.font = UIFont.pretendard(family: .Medium)
    }
    
    let arrowButton = UIButton().then{
        $0.setImage(UIImage(named: "arrow_down"), for: .normal)
    }
    
    let backView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUpView()
        setUpConstriant()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        self.contentView.addSubview(backView)
        
        self.backView.addSubview(titleLabel)
        self.backView.addSubview(countTextField)
        self.backView.addSubview(textFieldBorderLine)
        self.backView.addSubview(unitLabel)
        self.backView.addSubview(arrowButton)

    }
    
    func setUpConstriant(){
        self.backView.snp.makeConstraints{ make in
            make.height.equalTo(37)
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(8)
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(36)
        }
        
        countTextField.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(titleLabel.snp.trailing).offset(93)
        }
        
        textFieldBorderLine.snp.makeConstraints{ make in
            make.height.equalTo(1)
            make.centerY.equalToSuperview()
            make.leading.trailing.equalTo(countTextField)
        }
        
        unitLabel.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(arrowButton.snp.leading).offset(-4)
            make.leading.equalTo(countTextField.snp.trailing).offset(4)
        }
        
        arrowButton.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
            make.trailing.equalToSuperview().offset(-39)
        }
    }

}

class ProductDateChoiceUIView: BaseTableViewCell {
    
    static let cellIdentifier = "productDateCell"
    
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

        setUpView()
        setUpConstriant()
        
        labelArray = [titleLabel,yearLabel,monthLabel,dateLabel]
        textFieldArray = [yearTextField,monthTextField,dateTextField]

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        self.contentView.addSubview(backView)
        
        self.backView.addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(yearStack)
        stackView.addArrangedSubview(monthStack)
        stackView.addArrangedSubview(dateStack)
        
        self.yearStack.addArrangedSubview(yearTextField)
        self.yearStack.addArrangedSubview(yearLabel)
        self.yearStack.addSubview(yearBorderLine)
        
        self.monthStack.addArrangedSubview(monthTextField)
        self.monthStack.addArrangedSubview(monthLabel)
        self.monthStack.addSubview(monthBorderLine)
        
        self.dateStack.addArrangedSubview(dateTextField)
        self.dateStack.addArrangedSubview(dateLabel)
        self.dateStack.addSubview(dateBorderLine)
        
        self.backView.addSubview(checkButton)
        self.backView.addSubview(checkButtonLabel)
    }
    
    func setUpConstriant(){
        
        backView.snp.makeConstraints{ make in
            make.height.equalTo(73)
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(4)
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
    
    @objc
    func checkButtonListener(_ sender: ZatchRoundCheck){
        
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

}

class ProductOpenUIView: UITableViewCell {
    
    static let cellIdentifier = "productOpenCell"
    
    let titleLabel = UILabel().then{
        $0.text = "개봉상태"
        $0.textColor = .black
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
    }
    
    var radioButtonArray : [ZatchTextRadioButton]!
    
    let unOpenRadioButton = ZatchTextRadioButton().then{
        $0.setTitle("미개봉", for: .normal)
        $0.isSelected = true
        $0.addTarget(self, action: #selector(radioButtonSelectListener(_:)), for: .touchUpInside)
    }
    
    let openRadioButton = ZatchTextRadioButton().then{
        $0.setTitle("개봉", for: .normal)
        $0.addTarget(self, action: #selector(radioButtonSelectListener(_:)), for: .touchUpInside)
    }
    
    let backView = UIView()
    
    let stackView = UIStackView().then{
        $0.spacing = 8
        $0.axis = .horizontal
    }
    
    var currentSelect : ZatchTextRadioButton!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUpView()
        setUpConstriant()
        
        currentSelect = unOpenRadioButton

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        self.contentView.addSubview(backView)
        
        backView.addSubview(titleLabel)
        backView.addSubview(stackView)
        
        stackView.addArrangedSubview(unOpenRadioButton)
        stackView.addArrangedSubview(openRadioButton)
        
    }
    
    func setUpConstriant(){
        self.backView.snp.makeConstraints{ make in
            make.height.equalTo(37)
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(10)
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(36)
            make.centerY.equalToSuperview()
        }
        
        stackView.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(titleLabel.snp.trailing).offset(12)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        unOpenRadioButton.snp.makeConstraints{ make in
            make.width.equalTo(48)
            make.height.equalTo(20)
        }
        
        openRadioButton.snp.makeConstraints{ make in
            make.width.equalTo(37)
            make.height.equalTo(20)
        }
    }
    
    @objc
    func radioButtonSelectListener(_ sender: ZatchTextRadioButton){
        if(currentSelect != sender){
            currentSelect.isSelected = false
            sender.isSelected = true
            currentSelect = sender
        }
    }

}
