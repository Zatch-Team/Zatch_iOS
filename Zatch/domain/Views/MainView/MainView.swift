//
//  MainView.swift
//  Zatch
//
//  Created by gomin on 2022/09/06.
//

import UIKit

class MainView: UIView {
    // Navigation Views
    let navigationView = UIView()
    lazy var stackView = UIStackView().then{
        $0.isUserInteractionEnabled = true
        $0.spacing = 6
        $0.axis = .horizontal
    }
    lazy var locationLabel = UILabel().then{
        $0.text = "양재동" //temp
        $0.font = UIFont.pretendard(size: 20, family: .Bold)
        $0.textColor = .zatchDeepYellow
        $0.isUserInteractionEnabled = true
    }
    let arrowButton = UIButton().then{
        $0.setImage(UIImage(named: "arrow_down"), for: .normal)
        $0.setImage(UIImage(named: "arrow_up"), for: .selected)
    }
    lazy var searchButton = UIButton().then{
        $0.setImage(UIImage(named: "search"), for: .normal)
    }
    lazy var notiButton = UIButton().then{
        $0.setImage(UIImage(named: "bell"), for: .normal)
        $0.isUserInteractionEnabled = true
    }
    // TableView
    var mainTableView : UITableView!
    
    // MARK: - Functions
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUpTableView(dataSouceDelegate: UITableViewDelegate & UITableViewDataSource) {
        mainTableView = UITableView().then {
            $0.delegate = dataSouceDelegate
            $0.dataSource = dataSouceDelegate
            $0.register(MainBannerTableViewCell.self, forCellReuseIdentifier: "MainBannerTableViewCell")
            $0.register(MainCollectionViewTableViewCell.self, forCellReuseIdentifier: "MainCollectionViewTableViewCell")
            
            // autoHeight
            $0.rowHeight = UITableView.automaticDimension
            $0.estimatedRowHeight = UITableView.automaticDimension
            $0.showsVerticalScrollIndicator = false
            $0.separatorStyle = .none
        }
    }
    func setUpView() {
        addSubview(navigationView)
        addSubview(mainTableView)
        
        navigationView.addSubview(stackView)
        stackView.addArrangedSubview(locationLabel)
        stackView.addArrangedSubview(arrowButton)
        navigationView.addSubview(notiButton)
        navigationView.addSubview(searchButton)
    }
    func setUpConstraint() {
        setNavigationViewConstraint()
        
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    func setNavigationViewConstraint() {
        navigationView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(44)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(56)
        }
        stackView.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
            make.top.bottom.equalToSuperview()
        }
        locationLabel.snp.makeConstraints{ make in
            make.height.equalTo(24)
        }
        arrowButton.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
        }
        notiButton.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
        }
        searchButton.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(notiButton.snp.leading).offset(-12)
        }
    }
}
