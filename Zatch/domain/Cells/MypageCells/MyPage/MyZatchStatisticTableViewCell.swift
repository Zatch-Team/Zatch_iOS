//
//  MyZatchStatisticTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/12.
//

import UIKit

class MyZatchStatisticTableViewCell: UITableViewCell {
    let backView = UIView().then{
        $0.backgroundColor = .white
    }
    let titleLabel = UILabel().then{
        $0.text = "나의 재치 현황"
        $0.font = UIFont.pretendard(size: 15, family: .Bold)
    }
    let myZatchStack = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 28
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
        contentView.backgroundColor = .systemGray5
        contentView.addSubview(backView)
        
        backView.addSubview(titleLabel)
        backView.addSubview(myZatchStack)
        
        setMyZatch(setMyZatchCount(7, "나의 재치"))
        setMyZatch(setMyZatchCount(0, "관심 목록"))
        setMyZatch(setMyZatchCount(20, "교환 완료"))
    }
    func setUpConstraint() {
        backView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(20)
        }
        myZatchStack.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
    }
}
extension MyZatchStatisticTableViewCell {
    func setMyZatchCount(_ count: Int, _ title: String) -> UIStackView {
        let verticalStack = UIStackView().then{
            $0.axis = .vertical
        }
        let countLabel = UILabel().then{
            $0.text = String(count)
            $0.font = UIFont.pretendard(size: 32, family: .Bold)
            $0.textColor = .zatchPurple
            $0.textAlignment = .center
        }
        let titleLabel = UILabel().then{
            $0.text = title
            $0.font = UIFont.pretendard(size: 14, family: .Medium)
            $0.textColor = .black65
            $0.textAlignment = .center
        }
        verticalStack.addArrangedSubview(countLabel)
        verticalStack.addArrangedSubview(titleLabel)
        
        return verticalStack
    }
    func setMyZatch(_ stackView: UIStackView) {
        self.myZatchStack.addArrangedSubview(stackView)
    }
}
