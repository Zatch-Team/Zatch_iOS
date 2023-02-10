//
//  ProductIsOpenTableViewCell.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/10.
//

import Foundation

class ProductIsOpenTableViewCell: BaseTableViewCell {
    
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
    
//    let backView = UIView()
    
    let stackView = UIStackView().then{
        $0.spacing = 8
        $0.axis = .horizontal
    }
    
    var currentSelect : ZatchTextRadioButton!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        currentSelect = unOpenRadioButton

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hierarchy() {
        super.hierarchy()
        
        baseView.addSubview(titleLabel)
        baseView.addSubview(stackView)
        
        stackView.addArrangedSubview(unOpenRadioButton)
        stackView.addArrangedSubview(openRadioButton)
        
    }
    
    override func layout() {
        super.layout()
        
        baseView.snp.updateConstraints{
            $0.top.equalToSuperview().offset(10)
        }
        
        baseView.snp.makeConstraints{
            $0.height.equalTo(37)
            $0.leading.trailing.bottom.equalToSuperview()
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
    
    @objc func radioButtonSelectListener(_ sender: ZatchTextRadioButton){
        if(currentSelect != sender){
            currentSelect.isSelected = false
            sender.isSelected = true
            currentSelect = sender
        }
    }

}
