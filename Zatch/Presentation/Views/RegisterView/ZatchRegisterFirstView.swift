//
//  FirstRegisterView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/11/12.
//

import UIKit

class ZatchRegisterFirstView: BaseView {
    
    //MARK: - UI
    let topView = TitleView().then{
        $0.titleLabel.text = "주고 싶은\n물건이 무엇인가요?"
    }
    
    let backTableView = UITableView().then{
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = false
        
        $0.register(CategorySelectTableViewCell.self, forCellReuseIdentifier: CategorySelectTableViewCell.cellIdentifier)
        $0.register(ProductNameTabeViewCell.self, forCellReuseIdentifier: ProductNameTabeViewCell.cellIdentifier)
        $0.register(ImageAddTableViewCell.self, forCellReuseIdentifier: ImageAddTableViewCell.cellIdentifier)
        $0.register(FirstProductInfoTableView.self, forCellReuseIdentifier: FirstProductInfoTableView.cellIdentifier)
    }
    
    lazy var nextButton = Purple36Button(title: "다음 단계로")

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
        self.addSubview(topView)
        self.addSubview(backTableView)
        self.addSubview(nextButton)
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
