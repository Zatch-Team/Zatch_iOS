//
//  MainViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/05.
//

import Foundation

class MainViewController: BaseTabBarViewController<MainHeaderView>{
    
    @frozen
    enum ZatchCollectionViewType{
        case around
        case popular
    }
    
    private let mainView = MainView()
    private let viewModel = MainViewModel()
    private let townSelectBottomSheet = ChangeLocationSheetViewController()
    
    init(){
        super.init(headerView: MainHeaderView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reloadZatchCollectionView(type: .around)
        reloadZatchCollectionView(type: .popular)
    }
    
    override func layout() {
        super.layout()
        view.addSubview(mainView)
        mainView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Const.Offset.TOP_OFFSET)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    override func initialize() {
        
        mainView.tableView.initializeDelegate(self)
        
        headerView.stackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(townBottomSheetWillShow)))
        
        headerView.secondEtcButton.addTarget(self, action: #selector(goSearchButtonDidTap), for: .touchUpInside)
        headerView.etcButton.addTarget(self, action: #selector(goNotiButtonDidTap), for: .touchUpInside)
    }
    
    override func bind(){
        
        let input = MainViewModel.Input()
        let output = viewModel.transform(input)
        
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
        
        output.currentTown
            .drive{ [weak self] in
                self?.headerView.locationLabel.text = $0
            }.disposed(by: disposeBag)
    }
    
    
    
    // MARK: - Actions
    @objc func townBottomSheetWillShow() {
        townSelectBottomSheet.setViewModel(viewModel)
        townSelectBottomSheet.show(in: self)
    }
    
    @objc func goSearchButtonDidTap() {
        self.navigationController?.pushViewController(ExchangeMyZatchSearchViewController(), animated: true)
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
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCell(for: indexPath, cellType: BannerTableViewCell.self).then{
                $0.setBannerImage(Image.MainBanner)
            }
        case 1:
            return tableView.dequeueReusableCell(for: indexPath, cellType: MainCollectionViewTableViewCell.self).then{
                $0.setTitleAndSubtitle(title: "내 주변 재치", subtitle: "내 주변에서는 이런 재치들이 거래되고 있어요!")
                $0.collectionView.initializeDelegate(self)
            }
        case 2:
            return tableView.dequeueReusableCell(for: indexPath, cellType: BannerTableViewCell.self).then{
                $0.setBannerImage(Image.addZatchBanner)
            }
        case 3:
            return tableView.dequeueReusableCell(for: indexPath, cellType: MainCollectionViewTableViewCell.self).then{
                $0.setTitleAndSubtitle(title: "지금 인기있는 재치", subtitle: "재치 있는 자취인이 되는 법")
                $0.collectionView.initializeDelegate(self)
            }
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(ZatchSearchResultViewController(), animated: true)
            break
        case 2:
            self.navigationController?.pushViewController(ZatchRegisterFirstViewController(), animated: true)
            break
        default:
            return
        }
    }
}

extension MainViewController.ZatchCollectionViewType{
    var indexPath: IndexPath!{
        switch self{
        case .around:   return [0,1]
        case .popular:  return [0,3]
        }
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let type = getCellType(of: collectionView) else { return 0 }
        switch type{
        case .around:       return viewModel.aroundZatch.count
        case .popular:      return viewModel.popularZatch.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: MainZatchCollectionViewCell.self)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ZatchDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func getCellType(of collectionView: UICollectionView) -> ZatchCollectionViewType?{
        if let tableViewCell = mainView.tableView.cellForRow(at: ZatchCollectionViewType.around.indexPath) as? MainCollectionViewTableViewCell{
            return collectionView == tableViewCell.collectionView ? .around : .popular
        }
        return nil
    }
    
    private func reloadZatchCollectionView(type: ZatchCollectionViewType){
        if let cell = mainView.tableView.cellForRow(at: type.indexPath) as? MainCollectionViewTableViewCell{
            cell.collectionView.reloadData()
        }
    }
}
