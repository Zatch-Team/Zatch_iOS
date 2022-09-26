//
//  QuestionContentTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/27.
//

import UIKit

class QuestionContentTableViewCell: UITableViewCell {
    static let cellIdentifier = "QuestionContentTableViewCell"
    let titleLabel = UILabel().then{
        $0.text = "문의 내용"
        $0.font = UIFont.pretendard(size: 14, family: .Bold)
    }
    var questionTextView = UITextView().then{
        $0.layer.borderColor = UIColor.black10.cgColor
        $0.layer.borderWidth = 1.0
        $0.layer.cornerRadius = 8
        $0.textContainerInset = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
    }
    // MARK: - Life Cycles
    var textViewPlaceHolder = "내용을 입력해 주세요.\n입력시 개인 정보가 포함되지 않도록 유의해 주세요.\n(글자수 제한 : 1,000자)"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(questionTextView)
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(44)
            $0.leading.equalToSuperview().offset(20)
        }
        questionTextView.snp.makeConstraints { make in
            make.height.equalTo(309)
            make.leading.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Functions
    func setUpTextView(delegate: UITextViewDelegate) {
        questionTextView.then{
            $0.delegate = delegate
            $0.text = textViewPlaceHolder
            $0.textColor = .placeholderText
        }
    }
}
