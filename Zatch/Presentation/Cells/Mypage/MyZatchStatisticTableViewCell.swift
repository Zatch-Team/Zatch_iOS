//
//  MyZatchStatisticTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/12.
//

import UIKit

class MyZatchStatisticTableViewCell: BaseTableViewCell {
    
    var delegate: MyPageCellDelegate?

    private let titleLabel = UILabel().then{
        $0.text = "나의 재치 현황"
        $0.setTypoStyleWithSingleLine(typoStyle: .bold17)
    }
    private let myZatchStack = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 28
    }
    private let myZatchCountView = MyZatchCountView(title: "나의 재치").then{
        $0.setZatchCount(7)
    }
    private let heartCountView = MyZatchCountView(title: "관심 목록").then{
        $0.setZatchCount(0)
    }
    private let exchangeCountView = MyZatchCountView(title: "교환 완료").then{
        $0.setZatchCount(20)
    }
    private let borderLine = ZatchComponent.SectionDivider()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hierarchy() {
        
        super.hierarchy()
        
        baseView.addSubview(titleLabel)
        baseView.addSubview(myZatchStack)
        baseView.addSubview(borderLine)
        
        myZatchStack.addArrangedSubview(myZatchCountView)
        myZatchStack.addArrangedSubview(heartCountView)
        myZatchStack.addArrangedSubview(exchangeCountView)
    }
    
    override func layout() {
        
        super.layout()

        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(20)
        }
        myZatchStack.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
        }
        borderLine.snp.makeConstraints{
            $0.top.equalTo(myZatchStack.snp.bottom).offset(32)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    override func initialize() {
        myZatchCountView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(myZatchCountViewDidTapped)))
        heartCountView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(heartCountViewDidTapped)))
        exchangeCountView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(exchangeCountViewDidTapped)))
    }
    
    // MARK: - Actions
    @objc private func myZatchCountViewDidTapped() {
        delegate?.willMoveMyZatchViewController()
    }
    
    @objc private func heartCountViewDidTapped() {
        delegate?.willMoveHeartListViewController()
    }
    
    @objc private func exchangeCountViewDidTapped() {
        delegate?.willMoveExchangeFinishViewController()
    }
    
    func bindingData(){
        
    }
}

extension MyZatchStatisticTableViewCell{
    
    class MyZatchCountView: UIStackView{
        
        private let countLabel = UILabel().then{
            $0.font = UIFont.pretendard(size: 36, family: .Bold)
            $0.textColor = .zatchPurple
            $0.textAlignment = .center
        }
        private let titleLabel = UILabel().then{
            $0.setTypoStyleWithSingleLine(typoStyle: .medium16)
            $0.textColor = .black65
            $0.textAlignment = .center
        }
        
        init(title: String){
            titleLabel.text = title
            super.init(frame: .zero)
            style()
            hierarchy()
        }
        
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func style(){
            axis = .vertical
            spacing = 0
        }
        
        private func hierarchy(){
            self.addArrangedSubview(countLabel)
            self.addArrangedSubview(titleLabel)
        }
        
        func setZatchCount(_ count: Int){
            countLabel.text = String(count)
        }
    }
}
