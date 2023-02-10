//
//  ProductQuantityTableViewCell.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/10.
//

import Foundation

class ProductQuantityTableViewCell: BaseTableViewCell {
    
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
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(titleLabel)
        baseView.addSubview(countTextField)
        baseView.addSubview(textFieldBorderLine)
        baseView.addSubview(unitLabel)
        baseView.addSubview(arrowButton)
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
