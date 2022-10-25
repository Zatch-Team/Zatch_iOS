//
//  NoticeDetailTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/10/26.
//

import UIKit

class NoticeDetailTableViewCell: UITableViewCell {
    // MARK: - Views
    let noticeTitleLabel = UILabel().then{
        $0.text = "공지1234"
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.numberOfLines = 0
    }
    let dateLabel = UILabel().then{
        $0.text = "2022.10.19"
        $0.font = UIFont.pretendard(size: 13, family: .Medium)
        $0.textColor = .black20
    }
    let seperatorLine = UIView().then{
        $0.backgroundColor = .black20
    }
    let contentLabel = UILabel().then{
        $0.text = "안녕하세요. 재치 운영팀입니다. 해당 영역은 공지사항의 내용이 노출되는 영역입니다.감사합니다."
        $0.font = UIFont.pretendard(size: 14, family: .Regular)
        $0.numberOfLines = 0
    }

    // MARK: - LifeCycles
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
        self.contentView.addSubview(noticeTitleLabel)
        self.contentView.addSubview(dateLabel)
        self.contentView.addSubview(seperatorLine)
        self.contentView.addSubview(contentLabel)
    }
    func setUpConstraint() {
        noticeTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.trailing.equalToSuperview()
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(noticeTitleLabel.snp.bottom).offset(12)
            make.trailing.equalToSuperview()
        }
        seperatorLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
        }
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(seperatorLine.snp.bottom).offset(24)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
