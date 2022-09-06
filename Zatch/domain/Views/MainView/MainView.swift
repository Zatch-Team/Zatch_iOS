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
    let locationLabel = UILabel().then{
        $0.text = "양재동" //temp
        $0.font = UIFont.pretendard(size: 20, family: .Bold)
        $0.textColor = UIColor(named: "Zatch-Yellow")
    }
    let arrowButton = UIButton().then{
        $0.setImage(UIImage(named: "arrow_down"), for: .normal)
        $0.isUserInteractionEnabled = true
    }
    let searchButton = UIButton().then{
        $0.setImage(UIImage(named: "search"), for: .normal)
        $0.isUserInteractionEnabled = true
    }
    let notiButton = UIButton().then{
        $0.setImage(UIImage(named: "bell"), for: .normal)
        $0.isUserInteractionEnabled = true
    }
    // TableView
    var mainTableView : UITableView!
    
    // MARK: - Functions
    override init(frame: CGRect) {
        super.init(frame: frame)

        mainTableView = UITableView()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(MainBannerTableViewCell.self, forCellReuseIdentifier: "MainBannerTableViewCell")
        mainTableView.register(MainCollectionViewTableViewCell.self, forCellReuseIdentifier: "MainCollectionViewTableViewCell")
        
        // autoHeight
        mainTableView.rowHeight = UITableView.automaticDimension
        mainTableView.estimatedRowHeight = UITableView.automaticDimension
        mainTableView.showsVerticalScrollIndicator = false
        mainTableView.separatorStyle = .none
        
        setUpView()
        setUpConstraint()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        addSubview(navigationView)
        addSubview(mainTableView)
        
        navigationView.addSubview(locationLabel)
        navigationView.addSubview(arrowButton)
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
        locationLabel.snp.makeConstraints{ make in
            make.width.equalTo(53)
            make.height.equalTo(24)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
        }
        arrowButton.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
            make.centerY.equalToSuperview()
            make.leading.equalTo(locationLabel.snp.trailing).offset(6)
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
// MARK: - Main TableView delegate
extension MainView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tag = indexPath.row
        switch tag {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainBannerTableViewCell", for: indexPath) as? MainBannerTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainCollectionViewTableViewCell", for: indexPath) as? MainCollectionViewTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainBannerTableViewCell", for: indexPath) as? MainBannerTableViewCell else { return UITableViewCell() }
            cell.banner.image = UIImage(named: "addZatchBanner")
            cell.selectionStyle = .none
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainCollectionViewTableViewCell", for: indexPath) as? MainCollectionViewTableViewCell else { return UITableViewCell() }
            cell.label.text = "지금 인기있는 재치"
            cell.subLabel.text = "재치 있는 자취인이 되는 법"
            cell.selectionStyle = .none
            return cell
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tag = indexPath.row
        switch tag {
        case 0:
            return 153
        case 1:
            return 318
        case 2:
            return 150
        case 3:
            return 318
        default:
            return 50
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
