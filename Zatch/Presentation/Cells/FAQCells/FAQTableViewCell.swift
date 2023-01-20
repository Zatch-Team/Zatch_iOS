//
//  FAQTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/10/03.
//

import UIKit

class FAQTableViewCell: UITableViewCell {
    var titleLabel = UILabel().then{
        $0.text = "FAQ 제목 01"
        $0.font = UIFont.pretendard(size: 15, family: .Medium)
        $0.numberOfLines = 1
    }
    let arrowButton = UIButton().then{
        $0.setImage(Image.arrowDown, for: .normal)
        $0.setImage(Image.arrowUp, for: .selected)
    }
    
    // MARK: - Life Cycles
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Functions
    func setUpContent(_ data: FAQModel) {
        if data.isOpened! {arrowButton.isSelected = true}
        else {arrowButton.isSelected = false}
        
        titleLabel.text = data.questionTitle
    }
    func setUpView() {
        contentView.addSubview(arrowButton)
        contentView.addSubview(titleLabel)
        
    }
    func setUpConstraint() {
        arrowButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-24)
        }
        titleLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalTo(arrowButton.snp.leading).offset(-12)
        }
    }
    
}
