//
//  NoticeDetailView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/07.
//

import Foundation

class NoticeDetailView: BaseView {
    
    let noticeTitleLabel = UILabel().then{
        $0.text = "공지1234"
        $0.setTypoStyleWithMultiLine(typoStyle: .bold16)
        $0.numberOfLines = 0
    }
    let dateLabel = UILabel().then{
        $0.text = "2022.10.19"
        $0.font = UIFont.pretendard(size: 13, family: .Medium)
        $0.textColor = .black20
    }
    private let borderLine = ZatchComponent.BorderLine(color: .black5, height: 1)
    let contentLabel = UILabel().then{
        $0.text = "안녕하세요. 재치 운영팀입니다. 해당 영역은 공지사항의 내용이 노출되는 영역입니다.감사합니다."
        $0.setTypoStyleWithMultiLine(typoStyle: .regular15)
        $0.font = UIFont.pretendard(size: 14, family: .Regular)
        $0.numberOfLines = 0
    }

    // MARK: - Functions
    override func hierarchy() {
        addSubview(noticeTitleLabel)
        addSubview(dateLabel)
        addSubview(borderLine)
        addSubview(contentLabel)
    }
    
    override func layout() {
        noticeTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(noticeTitleLabel.snp.bottom).offset(12)
            $0.trailing.equalToSuperview().inset(20)
        }
        borderLine.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(borderLine.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.lessThanOrEqualToSuperview().inset(24)
        }
    }
}
