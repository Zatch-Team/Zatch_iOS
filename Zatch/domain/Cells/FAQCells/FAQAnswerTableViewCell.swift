//
//  FAQAnswerTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/10/03.
//

import UIKit

class FAQAnswerTableViewCell: UITableViewCell {
    let questionBackView = UIView().then{
        $0.backgroundColor = .black5
    }
    var questionTitleLabel = UILabel().then{
        $0.text = "[카테고리] 제목 01"
        $0.font = UIFont.pretendard(size: 15, family: .Medium)
        $0.numberOfLines = 0
    }
    var questionContentLabel = UILabel().then {
        $0.text = "content"
        $0.font = UIFont.pretendard(size: 14, family: .Regular)
        $0.numberOfLines = 0
    }
    // MARK: - Life Cycles
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: -  Functions
    func setUpView() {
        contentView.addSubview(questionBackView)
        
        questionBackView.addSubview(questionTitleLabel)
        questionBackView.addSubview(questionContentLabel)
        
        questionBackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview()
        }
        questionTitleLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(12)
        }
        questionContentLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(12)
            make.top.equalTo(questionTitleLabel.snp.bottom).offset(12)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
    // MARK: set cell data
    func setCellData(_ data: FAQModel) {
        let questionTitle = data.questionTitle
        let answerContent = data.answerContent
        
        questionTitleLabel.text = questionTitle
        questionContentLabel.text = answerContent
    }
}
