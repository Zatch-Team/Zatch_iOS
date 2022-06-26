//
//  FirstRegisterTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/19.
//

import UIKit

class ProductQuantityUIView: UITableViewCell {
    
    let titleLabel = UILabel()
    let countTextField = UITextField()
    let textFieldBorderLine = UIView()
    let unitLabel = UILabel()
    let arrowButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUpView()
        setUpConstriant()
        setUpValue()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(countTextField)
        self.contentView.addSubview(textFieldBorderLine)
        self.contentView.addSubview(unitLabel)
        self.contentView.addSubview(arrowButton)

    }
    
    func setUpConstriant(){
        self.contentView.snp.makeConstraints{ make in
            make.height.equalTo(37)
            make.width.equalToSuperview()
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
    
    func setUpValue(){
        
        titleLabel.text = "수량"
        titleLabel.font = UIFont.pretendard(family: .Medium)
        
        unitLabel.text = "(단위)"
        unitLabel.font = UIFont.pretendard(family: .Medium)
        
        textFieldBorderLine.backgroundColor = .black5
        
        arrowButton.setImage(UIImage(named: "arrow_down"), for: .normal)
    }

}

class ProducDateChoiceUIView: UITableViewCell {
    
    let titleLabel = UILabel()
    
    let yearTextField = UITextField()
    let yearLabel = UILabel()
    let yearBorderLine = UIView()
    
    let monthTextField = UITextField()
    let monthLabel = UILabel()
    let monthBorderLine = UIView()
    
    let dateTextField = UITextField()
    let dateLabel = UILabel()
    let dateBorderLine = UIView()
    
    let checkButton = UIButton()
    let checkButtonLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUpView()
        setUpConstriant()
        setUpValue()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(yearTextField)
        self.contentView.addSubview(yearLabel)
        self.contentView.addSubview(yearBorderLine)
        self.contentView.addSubview(monthTextField)
        self.contentView.addSubview(monthLabel)
        self.contentView.addSubview(monthBorderLine)
        self.contentView.addSubview(dateTextField)
        self.contentView.addSubview(dateLabel)
        self.contentView.addSubview(dateBorderLine)
        self.contentView.addSubview(checkButton)
        self.contentView.addSubview(checkButtonLabel)
    }
    
    func setUpConstriant(){
        self.contentView.snp.makeConstraints{ make in
            make.height.equalTo(60)
            make.width.equalToSuperview()
        }
    }
    
    func setUpValue(){
        
    }

}

class ProductOpenUIView: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUpView()
        setUpConstriant()
        setUpValue()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
    }
    
    func setUpConstriant(){
        self.contentView.snp.makeConstraints{ make in
            make.height.equalTo(37)
            make.width.equalToSuperview()
        }
    }
    
    func setUpValue(){
        
    }

}
