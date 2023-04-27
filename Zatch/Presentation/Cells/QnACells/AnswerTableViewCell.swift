//
//  AnswerTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/27.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {
    let stack = UIStackView().then{
        $0.spacing = 0
        $0.axis = .vertical
    }
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
    let answerBackView = UIView().then{
        $0.backgroundColor = .white
    }
    var answerTitleLabel = UILabel().then{
        $0.text = "answer"
        $0.font = UIFont.pretendard(size: 15, family: .Medium)
        $0.numberOfLines = 0
    }
    var answerContentLabel = UILabel().then {
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
        contentView.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        stack.addArrangedSubview(questionBackView)
        stack.addArrangedSubview(answerBackView)
        
        questionBackView.addSubview(questionTitleLabel)
        questionBackView.addSubview(questionContentLabel)
        answerBackView.addSubview(answerTitleLabel)
        answerBackView.addSubview(answerContentLabel)
        
        questionBackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
        }
        answerBackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        questionTitleLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(12)
        }
        questionContentLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(12)
            make.top.equalTo(questionTitleLabel.snp.bottom).offset(12)
            make.bottom.equalToSuperview().offset(-12)
        }
        answerTitleLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(12)
        }
        answerContentLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(12)
            make.top.equalTo(answerTitleLabel.snp.bottom).offset(12)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
//    // MARK: set cell data
//    func setCellData(_ data: AnswerModel) {
//        questionTitleLabel.text = data.questionTitle
//        questionContentLabel.text = data.questionContent
//        answerTitleLabel.text = data.answerTitle
//        answerContentLabel.text = data.answerContent
//    }
}
