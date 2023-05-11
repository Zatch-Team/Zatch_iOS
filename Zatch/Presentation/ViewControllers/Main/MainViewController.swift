//
//  MainViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/05.
//

import Foundation

class MainViewController: BaseTabBarViewController<MainHeaderView>{
    
    @frozen
    enum ZatchDataType{
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
            .bind(onNext: { [weak self] in
                self?.headerView.arrowButton.isSelected = true
            }).disposed(by: disposeBag)
        
        townSelectBottomSheet.rx.viewWillDisappear
            .map{ _ in }
            .bind(onNext: { [weak self] in
                self?.headerView.arrowButton.isSelected = false
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
//        self.navigationController?.pushViewController(NotificationViewController(), animated: true)
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
                $0.collectionView.tag = ZatchDataType.around.tag
            }
        case 2:
            return tableView.dequeueReusableCell(for: indexPath, cellType: BannerTableViewCell.self).then{
                $0.setBannerImage(Image.addZatchBanner)
            }
        case 3:
            return tableView.dequeueReusableCell(for: indexPath, cellType: MainCollectionViewTableViewCell.self).then{
                $0.setTitleAndSubtitle(title: "지금 인기있는 재치", subtitle: "재치 있는 자취인이 되는 법")
                $0.collectionView.initializeDelegate(self)
                $0.collectionView.tag = ZatchDataType.popular.tag
            }
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(ZatchSearchResultViewController(), animated: true)
            break
        case 2:
            navigationController?.pushViewController(RegisterFirstInfoViewController(), animated: true)
            break
        default:
            return
        }
    }
}

extension MainViewController.ZatchDataType{
    
    var indexPath: IndexPath{
        switch self{
        case .around:   return [0,1]
        case .popular:  return [0,3]
        }
    }
    
    var tag: Int{
        switch self{
        case .around:   return 100
        case .popular:  return 200
        }
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch getCellType(of: collectionView){
        case .around:       return viewModel.aroundZatch.count
        case .popular:      return viewModel.popularZatch.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(for: indexPath, cellType: MainZatchCollectionViewCell.self).then{
            $0.viewModel = viewModel
            $0.dataType = .around
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(ZatchDetailViewController(), animated: true)
    }
    
    private func getCellType(of collectionView: UICollectionView) -> ZatchDataType{
        collectionView.tag == ZatchDataType.around.tag ? .around : .popular
    }
    
    private func reloadZatchCollectionView(type: ZatchDataType){
        if let cell = mainView.tableView.cellForRow(at: type.indexPath) as? MainCollectionViewTableViewCell{
            cell.collectionView.reloadData()
        }
    }
}
