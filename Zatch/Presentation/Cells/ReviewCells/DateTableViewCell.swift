//
//  DateTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/10/05.
//

import UIKit

class DateTableViewCell: UITableViewCell {
    var dateLabel = UILabel().then{
        $0.text = "2022-07-15"
        $0.font = UIFont.pretendard(size: 12, family: .Regular)
        $0.textColor = .black45
    }
    let seperatorLineLeft = UIView().then{
        $0.backgroundColor = .black45
    }
    let seperatorLineRight = UIView().then{
        $0.backgroundColor = .black45
    }

    // MARK: - LifeCycles
    var reviewDate: String!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Functions
    func setUpView() {
        contentView.addSubview(dateLabel)
        contentView.addSubview(seperatorLineLeft)
        contentView.addSubview(seperatorLineRight)
    }
    func setUpConstraint() {
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
