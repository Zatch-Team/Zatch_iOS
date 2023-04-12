//
//  ProductQuantityTableViewCell.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/10.
//

import Foundation

class ProductQuantityTableViewCell: BaseTableViewCell {
    
    //MARK: - UIView
    
    var delegate: ZatchRegisterDelegate!
    
    private let titleLabel = UILabel().then{
        $0.text = "수량"
        $0.font = UIFont.pretendard(family: .Medium)
    }
    
    let countTextField = UITextField().then{
        $0.textAlignment = .center
        $0.keyboardType = .numberPad
    }
    
    private let textFieldBorderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    private let unitStackView = UIStackView().then{
        $0.isUserInteractionEnabled = true
        $0.axis = .horizontal
        $0.spacing = 4
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
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(titleLabel)
        baseView.addSubview(countTextField)
        baseView.addSubview(textFieldBorderLine)
        baseView.addSubview(unitStackView)
        
        unitStackView.addArrangedSubview(unitLabel)
        unitStackView.addArrangedSubview(arrowButton)
    }
    
    override func layout() {
        
        super.layout()
        
        baseView.snp.makeConstraints{ make in
            make.height.equalTo(37)
        }
        
        baseView.snp.updateConstraints{ make in
            make.top.equalToSuperview().offset(8)
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(36)
        }
        
        countTextField.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.leading.equalTo(titleLabel.snp.trailing).offset(93)
        }
        
        textFieldBorderLine.snp.makeConstraints{ make in
            make.height.equalTo(1)
            make.bottom.equalTo(countTextField)
            make.leading.trailing.equalTo(countTextField)
        }
        unitStackView.snp.makeConstraints{
            $0.leading.equalTo(countTextField.snp.trailing).offset(4)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(39)
        }
        unitLabel.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
        }
        
        arrowButton.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
    }
    
    private func initialize(){
        unitStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(unitStackViewDidTapped)))
    }
    
    @objc private func unitStackViewDidTapped(){
        delegate.willShowUnitBottomSheet()
    }

}
