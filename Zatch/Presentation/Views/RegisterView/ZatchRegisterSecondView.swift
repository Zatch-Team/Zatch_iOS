//
//  SecondRegisterView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/11/12.
//

import UIKit

class ZatchRegisterSecondView: BaseView {
    
    //MARK: - UI
    
    private let topTitleView = TopTitleView(title: "받고 싶은\n물건이 있나요?")
    
    let tableView = UITableView().then{
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = Device.isSmallDevice ? true : false
        $0.contentInset = UIEdgeInsets(top: -10, left: 0, bottom: 0, right: 0)
        $0.register(cellType: RegisterPriorityTableViewCell.self)
        $0.register(cellType: RegisterCategorySelectTableViewCell.self)
        $0.register(cellType: TextFieldTabeViewCell.self)
        $0.register(cellType: AnyZatchSelectTableViewCell.self)
    }
    
    private let btnFrame = UIStackView().then{
        $0.spacing = 10
        $0.axis = .horizontal
    }
    
    lazy var shareBtn = WhitePurpleButton().then{
        $0.setTitle("나눔", for: .normal)
    }
    
    lazy var nextBtn = Purple36Button(title: "다음 단계로")
    
    override func hierarchy() {
        
        addSubview(topTitleView)
        addSubview(tableView)
        addSubview(btnFrame)
        
        btnFrame.addArrangedSubview(shareBtn)
        btnFrame.addArrangedSubview(nextBtn)
    }
    
    override func layout() {
        
        topTitleView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(topTitleView.snp.bottom).offset(-11)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(btnFrame).inset(10)
        }
        
        btnFrame.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(25)
            $0.trailing.equalToSuperview().offset(-15)
            $0.bottom.equalToSuperview().offset(-48)
        }
        
        nextBtn.snp.makeConstraints{
            $0.width.equalTo(shareBtn)
        }
    }
}
