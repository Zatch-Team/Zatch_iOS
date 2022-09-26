//
//  MyQuestionTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/27.
//

import UIKit

class MyQuestionTableViewCell: UITableViewCell {
    var titleLabel = UILabel().then{
        $0.text = "[카테고리] 제목 01"
        $0.font = UIFont.pretendard(size: 15, family: .Medium)
        $0.numberOfLines = 1
    }
    var stateButton = PurpleButton(title: "답변 예정", height: 24, fontSize: 13).then{
        $0.isEnabled = false
    }
    let arrowButton = UIButton().then{
        $0.setImage(UIImage(named: "arrow_down"), for: .normal)
        $0.setImage(UIImage(named: "arrow_up"), for: .selected)
    }
    
    // MARK: - Life Cycles
    var isAnswered: Bool?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Functions
    func setUpContent(_ data: QnAModel) {
        self.isAnswered = data.isAnswered
        if isAnswered! {
            stateButton.isEnabled = true
            stateButton.setTitle("답변 완료", for: .normal)
        } else {
            stateButton.isEnabled = false
            stateButton.setTitle("답변 예정", for: .normal)
        }
        if data.isOpened! {arrowButton.isSelected = true}
        else {arrowButton.isSelected = false}
        
        titleLabel.text = data.questionTitle
    }
    func setUpView() {
        contentView.addSubview(arrowButton)
        contentView.addSubview(stateButton)
        contentView.addSubview(titleLabel)
        
    }
    func setUpConstraint() {
        arrowButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-24)
        }
        stateButton.snp.makeConstraints { make in
            make.width.equalTo(73)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(arrowButton.snp.leading).offset(-12)
        }
        titleLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalTo(stateButton.snp.leading).offset(-12)
        }
    }
    
}
