//
//  MainViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/05.
//

import Foundation

class MainViewController: BaseTabBarViewController<MainHeaderView>{
    
    private let mainView = MainView()
    private let viewModel = MainViewModel()
    private let townSelectBottomSheet = ChangeLocationSheetViewController()
    
    init(){
        super.init(headerView: MainHeaderView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        super.layout()
        self.view.addSubview(mainView)
        mainView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Const.Offset.TOP_OFFSET)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    override func initialize() {
        
        mainView.mainTableView.delegate = self
        mainView.mainTableView.dataSource = self
        mainView.mainTableView.separatorStyle = .none
        
        headerView.stackView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                         action: #selector(townBottomSheetWillShow)))
        
        headerView.secondEtcButton.addTarget(self, action: #selector(goSearchButtonDidTap), for: .touchUpInside)
//        headerView.etcButton.addTarget(self, action: #selector(goNotiButtonDidTap), for: .touchUpInside)
    }
    
    override func bind(){
        
        /*
        let input = MainViewModel.Input()
        let output = viewModel.transform(input)
         */
        
        townSelectBottomSheet.rx.viewWillAppear
            .map{ _ in }
            .bind(onNext: {
                self.headerView.arrowButton.isSelected = true
            }).disposed(by: disposeBag)
        
        townSelectBottomSheet.rx.viewWillDisappear
            .map{ _ in }
            .bind(onNext: {
                self.headerView.arrowButton.isSelected = false
            }).disposed(by: disposeBag)
    }
    
    
    
    // MARK: - Actions
    @objc func townBottomSheetWillShow() {

        _ = townSelectBottomSheet.show(in: self)
        
        let currentLocation = headerView.locationLabel.text
        townSelectBottomSheet.myLocation = currentLocation
        townSelectBottomSheet.completion = { town in
            self.headerView.locationLabel.text = town
        }
    }
    
    @objc func goSearchButtonDidTap() {
//        self.navigationController?.pushViewController(MySearchViewController(),
//                                                      animated: true)
    }
    
    @objc func goNotiButtonDidTap() {
//        self.navigationController?.pushViewController(NotificationViewController(),
//                                                      animated: true)
    }
}

// MARK: - Main TableView delegate
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
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
            _ = cell.then{
                $0.setUpCollectionView(self)
                $0.setUpView()
                $0.setUpConstraint()
                $0.selectionStyle = .none
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainBannerTableViewCell", for: indexPath) as? MainBannerTableViewCell else { return UITableViewCell() }
            cell.banner.image = Image.addZatchBanner
            cell.selectionStyle = .none
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainCollectionViewTableViewCell", for: indexPath) as? MainCollectionViewTableViewCell else { return UITableViewCell() }
            _ = cell.then{
                $0.label.text = "지금 인기있는 재치"
                $0.subLabel.text = "재치 있는 자취인이 되는 법"
                
                $0.setUpCollectionView(self)
                $0.setUpView()
                $0.setUpConstraint()
                $0.selectionStyle = .none
            }
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
            return 160
        case 1, 3:
            return 300
        case 2:
            return 150
        default:
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tag = indexPath.row
        switch tag {
//        case 0:
//            let vc = ResultSearchViewController()
//            self.navigationController?.pushViewController(vc, animated: true)
//            break
//        case 2:
//            let vc = FirstRegisterViewController()
//            self.navigationController?.pushViewController(vc, animated: true)
//            break
        default:
            return
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - 메인페이지의 콜렉션뷰를 갖고있는 테이블뷰의 CollectionView delegate
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainZatchCollectionViewCell.cellIdentifier,
                                                            for: indexPath)
                as? MainZatchCollectionViewCell else{ fatalError() }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = ZatchDetailViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}
