//
//  DateTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/10/05.
//

import UIKit

class DateTableViewCell: BaseTableViewCell {
    
    var reviewDate: String!
    
    var dateLabel = UILabel().then{
        $0.text = "2022-07-15"
        $0.setTypoStyleWithSingleLine(typoStyle: .regular12)
        $0.textColor = .black45
    }
    private let seperatorLineLeft = UIView().then{
        $0.backgroundColor = .black45
    }
    private let seperatorLineRight = UIView().then{
        $0.backgroundColor = .black45
    }

    // MARK: - Functions
    override func hierarchy() {
        super.hierarchy()

        baseView.addSubview(dateLabel)
        baseView.addSubview(seperatorLineLeft)
        baseView.addSubview(seperatorLineRight)
    }
    
    override func layout() {
        super.layout()

        dateLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        seperatorLineLeft.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.centerY.equalTo(dateLabel)
            make.leading.equalToSuperview()
            make.trailing.equalTo(dateLabel.snp.leading).offset(-16)
        }
        seperatorLineRight.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.centerY.equalTo(dateLabel)
            make.trailing.equalToSuperview()
            make.leading.equalTo(dateLabel.snp.trailing).offset(16)
        }
    }
}
