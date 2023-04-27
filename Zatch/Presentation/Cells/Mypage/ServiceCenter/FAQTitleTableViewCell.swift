//
//  FAQTitleTableViewCell.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/26.
//

import Foundation

final class FAQTitleTableViewCell: BaseTableViewCell{
    
    var isContentOpen: Bool = false{
        didSet{
            arrowButton.isSelected = isContentOpen
        }
    }
    
    var title: String!{
        didSet{
            titleLabel.text = title
        }
    }
    
    private let titleStackView = UIStackView().then{
        $0.spacing = 8
        $0.axis = .horizontal
    }
    
    private let faqLabel = UILabel().then{
        $0.text = "FAQ"
        $0.textColor = .black85
        $0.setTypoStyleWithSingleLine(typoStyle: .medium16)
    }
    
    private let titleLabel = UILabel().then{
        $0.textColor = .black85
        $0.setTypoStyleWithSingleLine(typoStyle: .medium16)
    }
    
    private let arrowButton = UIButton().then{
        $0.setImage(Image.arrowDown, for: .normal)
        $0.setImage(Image.arrowUp, for: .selected)
    }
    
    override func hierarchy() {
        super.hierarchy()
        addSubview(titleStackView)
        titleStackView.addArrangedSubview(faqLabel)
        titleStackView.addArrangedSubview(titleLabel)
        addSubview(arrowButton)
    }
    
    override func layout() {
        super.layout()
        titleStackView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.lessThanOrEqualTo(arrowButton.snp.leading).inset(12)
        }
        arrowButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().inset(24)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(arrowButton.snp.height)
        }
    }
}
