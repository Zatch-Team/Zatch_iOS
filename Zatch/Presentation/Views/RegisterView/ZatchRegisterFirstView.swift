//
//  FirstRegisterView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/11/12.
//

import UIKit

class ZatchRegisterFirstView: BaseView {
    
    //MARK: - UI
    private let topView = TopTitleView(title: "주고 싶은\n물건이 무엇인가요?")
    
    let backTableView = UITableView().then{
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = false
        
        $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
        
        $0.register(cellType: RegisterCategorySelectTableViewCell.self)
        $0.register(cellType: TextFieldTabeViewCell.self)
        $0.register(cellType: ImageAddTableViewCell.self)
        $0.register(cellType: MoreInformationTableViewCell.self)
        $0.register(cellType: ProductQuantityTableViewCell.self)
        $0.register(cellType: ProductDateChoiceTableViewCell.self)
        $0.register(cellType: ProductIsOpenTableViewCell.self)
    }
    
    lazy var nextButton = Purple36Button(title: "다음 단계로")
    
    override func hierarchy() {
        addSubview(topView)
        addSubview(backTableView)
        addSubview(nextButton)
    }
    
    override func layout() {
        topView.snp.makeConstraints{ make in
            make.top.leading.trailing.equalToSuperview()
        }
        backTableView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.top.equalTo(topView.snp.bottom)
            make.bottom.equalTo(nextButton.snp.top).offset(-5)
        }
        nextButton.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(74)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
            make.top.equalTo(backTableView.snp.bottom).offset(40)
        }
    }
}
