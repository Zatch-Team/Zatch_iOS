//
//  NoticeTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/10/26.
//

import UIKit

class NoticeTableViewCell: UITableViewCell {
    // MARK: - Views
    let noticeTitleLabel = UILabel().then{
        $0.text = "공지1234"
        $0.font = UIFont.pretendard(size: 15, family: .Medium)
        $0.numberOfLines = 0
    }
    let dateLabel = UILabel().then{
        $0.text = "2022.10.19"
        $0.font = UIFont.pretendard(size: 13, family: .Medium)
        $0.textColor = .black20
    }

    // MARK: - LifeCycles
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(noticeTitleLabel)
        self.contentView.addSubview(dateLabel)
        
        noticeTitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(12)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(noticeTitleLabel.snp.bottom).offset(12)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
