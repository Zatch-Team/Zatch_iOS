//
//  MainView.swift
//  Zatch
//
//  Created by gomin on 2022/09/06.
//

import UIKit

class MainHeaderView: BaseHeaderView, SecondEtcButtonProtocol{
    
    lazy var stackView = UIStackView().then{
        $0.isUserInteractionEnabled = true
        $0.spacing = 6
        $0.axis = .horizontal
    }
    lazy var locationLabel = UILabel().then{
        $0.text = "양재동" //temp
        $0.font = UIFont.pretendard(size: 20, family: .Bold)
        $0.textColor = .zatchDeepYellow
        $0.isUserInteractionEnabled = false
    }
    let arrowButton = UIButton().then{
        $0.isUserInteractionEnabled = false
        $0.setImage(Image.arrowDown, for: .normal)
        $0.setImage(Image.arrowUp, for: .selected)
    }

    lazy var secondEtcButton = EtcButton(image: Image.search)
    
    init(){
        super.init(image: Image.bell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func hierarchy() {
        super.hierarchy()
        self.addSubview(stackView)
        stackView.addArrangedSubview(locationLabel)
        stackView.addArrangedSubview(arrowButton)
    }
    
    override func layout() {
        
        super.layout()
        
        stackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(24)
            $0.centerY.equalToSuperview()
        }

        arrowButton.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
        }
        setSecondEtcButtonLayout()
    }
}

class MainView: BaseView {

    let mainTableView = UITableView().then {
        $0.register(MainBannerTableViewCell.self, forCellReuseIdentifier: "MainBannerTableViewCell")
        $0.register(MainCollectionViewTableViewCell.self, forCellReuseIdentifier: "MainCollectionViewTableViewCell")
        
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = UITableView.automaticDimension
        $0.showsVerticalScrollIndicator = false
    }
    
    override func hierarchy() {
        self.addSubview(mainTableView)
    }

    override func layout() {
        mainTableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}