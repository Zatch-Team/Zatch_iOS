//
//  FAQContentTableViewCell.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/26.
//

import Foundation

final class FAQContentTableViewCell: BaseTableViewCell{
    
    let titleLabel = UILabel().then{
        $0.numberOfLines = 0
        $0.setTypoStyleWithSingleLine(typoStyle: .medium16)
        $0.textColor = .black85
    }
    let commentLabel = UILabel().then{
        $0.numberOfLines = 0
        $0.textColor = .black85
        $0.setTypoStyleWithMultiLine(typoStyle: .regular15)
    }
    
    private let silverBackgroundView = UIView().then{
        $0.backgroundColor = .black5
    }
    private let topBorderLine = UIView().then{
        $0.backgroundColor = .black10
    }
    private let bottomBorderLine = UIView().then{
        $0.backgroundColor = .black10
    }
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(silverBackgroundView)
        silverBackgroundView.addSubview(topBorderLine)
        silverBackgroundView.addSubview(titleLabel)
        silverBackgroundView.addSubview(commentLabel)
        silverBackgroundView.addSubview(bottomBorderLine)
    }
    
    override func layout() {
        super.layout()
        silverBackgroundView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(18)
        }
        topBorderLine.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }
        bottomBorderLine.snp.makeConstraints{
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(12)
            $0.leading.trailing.equalToSuperview().inset(12)
        }
        commentLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.leading.trailing.bottom.equalToSuperview().inset(12)
        }
    }
}
