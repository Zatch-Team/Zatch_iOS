//
//  FirstRegisterTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/19.
//

import UIKit

class ProductQuantityUIView: BaseTableViewCell {
    
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
        $0.setImage(Image.arrowDown, for: .normal)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUpView()
        setUpConstriant()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        baseView.addSubview(titleLabel)
        baseView.addSubview(countTextField)
        baseView.addSubview(textFieldBorderLine)
        baseView.addSubview(unitLabel)
        baseView.addSubview(arrowButton)
    }
    
    func setUpConstriant(){
        
        baseView.snp.updateConstraints{ make in
            make.top.equalToSuperview().offset(8)
        }
        
        baseView.snp.makeConstraints{ make in
            make.height.equalTo(37)
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


class ProductOpenUIView: BaseTableViewCell {
    
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
