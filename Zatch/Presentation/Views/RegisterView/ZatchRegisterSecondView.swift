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
        
        $0.register(CategorySelectWithRankTableViewCell.self, forCellReuseIdentifier: CategorySelectWithRankTableViewCell.cellIdentifier)
        $0.register(ProductNameTabeViewCell.self, forCellReuseIdentifier: ProductNameTabeViewCell.cellIdentifier)
    }
    
    let checkBoxFrame = UIStackView().then{
        $0.spacing = 16
        $0.axis = .vertical
    }
    
    let topCheckBoxFrame = UIStackView().then{
        $0.spacing = 8
        $0.axis = .horizontal
    }
    
    let topCheckBoxBtn = ZatchRoundCheck().then{
        $0.tag = 0
        $0.isSelected = true
    }
    
    let topCheckBoxLabel = UILabel().then{
        $0.text = "다른 것도 괜찮아요!"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
    }
    
    let belowCheckBoxFrame = UIStackView().then{
        $0.spacing = 8
        $0.axis = .horizontal
    }
    
    let belowCheckBoxBtn = ZatchRoundCheck().then{
        $0.tag = 1
        $0.isSelected = false
    }
    
    let belowCheckBoxLabel = UILabel().then{
        $0.text = "이 것만 가능해요!"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
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
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func hierarchy() {
        
//        self.addSubview(exitBtn)
        self.addSubview(topTitleView)
        self.addSubview(tableView)
        self.addSubview(checkBoxFrame)
        self.addSubview(btnFrame)
        
        self.checkBoxFrame.addArrangedSubview(topCheckBoxFrame)
        self.checkBoxFrame.addArrangedSubview(belowCheckBoxFrame)
        
        topCheckBoxFrame.addArrangedSubview(topCheckBoxBtn)
        topCheckBoxFrame.addArrangedSubview(topCheckBoxLabel)
        
        belowCheckBoxFrame.addArrangedSubview(belowCheckBoxBtn)
        belowCheckBoxFrame.addArrangedSubview(belowCheckBoxLabel)
        
        btnFrame.addArrangedSubview(shareBtn)
        btnFrame.addArrangedSubview(nextBtn)
    }
    
    override func layout() {
        
//        exitBtn.snp.makeConstraints{ make in
//            make.trailing.equalToSuperview().offset(-16)
//            make.centerY.equalTo(self.backBtn)
//        }
        
        topTitleView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints{ make in
            make.top.equalTo(topTitleView.snp.bottom).offset(-11)
            make.leading.trailing.equalToSuperview()
        }
        
        checkBoxFrame.snp.makeConstraints{ make in
            make.top.equalTo(tableView.snp.bottom).offset(36)
            make.leading.equalToSuperview().offset(24)
        }
        
        topCheckBoxBtn.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
        }
        
        belowCheckBoxBtn.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
        }
        
        btnFrame.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-48)
            make.top.equalTo(checkBoxFrame.snp.bottom).offset(68) //68
        }
        
        nextBtn.snp.makeConstraints{ make in
            make.width.equalTo(shareBtn)
        }
    }
}
