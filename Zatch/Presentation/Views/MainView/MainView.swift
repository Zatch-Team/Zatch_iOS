//
//  MainView.swift
//  Zatch
//
//  Created by gomin on 2022/09/06.
//

import UIKit

class MainHeaderView: BaseView, HeaderFirstEtcButton, HeaderSecondEtcButton{
    
    lazy var stackView = UIStackView().then{
        $0.isUserInteractionEnabled = true
        $0.spacing = 6
        $0.axis = .horizontal
    }
    lazy var locationLabel = UILabel().then{
        $0.text = "양재동"
        $0.setTypoStyleWithSingleLine(typoStyle: .bold20)
        $0.textColor = .zatchDeepYellow
        $0.isUserInteractionEnabled = false
    }
    let arrowButton = UIButton().then{
        $0.isUserInteractionEnabled = false
        $0.setImage(Image.arrowDown, for: .normal)
        $0.setImage(Image.arrowUp, for: .selected)
    }

    lazy var etcButton = EtcButton(image: Image.bell)
    lazy var secondEtcButton = EtcButton(image: Image.search)

    override func hierarchy() {
        super.hierarchy()
        self.addSubview(stackView)
        stackView.addArrangedSubview(locationLabel)
        stackView.addArrangedSubview(arrowButton)
    }
    
    override func layout() {
        
        super.layout()
        
        self.snp.makeConstraints{
            $0.height.equalTo(60)
        }
        
        stackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(24)
            $0.centerY.equalToSuperview()
        }
        arrowButton.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
        }
        
        setEtcButtonLayout()
        setSecondEtcButtonLayout()
    }
}

class MainView: BaseView {

    let tableView = UITableView().then {
        $0.register(cellType: BannerTableViewCell.self)
        $0.register(cellType: MainCollectionViewTableViewCell.self)
        
        $0.showsVerticalScrollIndicator = false
    }
    
    override func hierarchy() {
        self.addSubview(tableView)
    }

    override func layout() {
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
