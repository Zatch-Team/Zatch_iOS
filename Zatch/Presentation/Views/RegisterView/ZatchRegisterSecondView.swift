//
//  SecondRegisterView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/11/12.
//

import UIKit

class ZatchRegisterSecondView: BaseView {
    
    //MARK: - UI
    
    let topTitleView = TitleView().then{
        $0.titleLabel.text = "받고 싶은\n물건이 있나요?"
    }
    
    var tableView = UITableView().then{
        $0.showsVerticalScrollIndicator = false
        
        $0.register(cellType: RegisterCategorySelectWithPriorityTableViewCell.self)
        $0.register(cellType: TextFieldTabeViewCell.self)
    }
    
    let radioButtonFrame = UIStackView().then{
        $0.spacing = 16
        $0.axis = .vertical
    }
    
    let topRadioButtonFrame = ZatchComponent.RadioButtonView().then{
        $0.setTitle("다른 것도 괜찮아요!")
        $0.isSelected = true
    }
    let belowRadioButtonFrame = ZatchComponent.RadioButtonView().then{
        $0.setTitle("이 것만 가능해요!")
    }
    
    let btnFrame = UIStackView().then{
        $0.spacing = 10
        $0.axis = .horizontal
    }
    
    lazy var shareBtn = WhitePurpleButton().then{
        $0.setTitle("나눔", for: .normal)
    }
    
    lazy var nextBtn = Purple36Button(title: "다음 단계로")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        topRadioButtonFrame.isSelected = true
    }

    override func hierarchy() {
        
        self.addSubview(topTitleView)
        self.addSubview(tableView)
        self.addSubview(radioButtonFrame)
        self.addSubview(btnFrame)
        
        self.radioButtonFrame.addArrangedSubview(topRadioButtonFrame)
        self.radioButtonFrame.addArrangedSubview(belowRadioButtonFrame)
        
        btnFrame.addArrangedSubview(shareBtn)
        btnFrame.addArrangedSubview(nextBtn)
    }
    
    override func layout() {
        
        topTitleView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints{ make in
            make.top.equalTo(topTitleView.snp.bottom).offset(-11)
            make.leading.trailing.equalToSuperview()
        }
        
        radioButtonFrame.snp.makeConstraints{ make in
            make.top.equalTo(tableView.snp.bottom).offset(36)
            make.leading.equalToSuperview().offset(24)
        }
        
        btnFrame.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-48)
            make.top.equalTo(radioButtonFrame.snp.bottom).offset(68) //68
        }
        
        nextBtn.snp.makeConstraints{ make in
            make.width.equalTo(shareBtn)
        }
    }
}
