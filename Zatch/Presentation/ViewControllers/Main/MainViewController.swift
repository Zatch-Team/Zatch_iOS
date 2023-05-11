//
//  MainViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/05.
//

import Foundation

class MainViewController: BaseTabBarViewController<MainHeaderView>{
    
    @frozen
    enum ZatchData: Int{
        case around = 100
        case popular = 200
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
                $0.collectionView.tag = ZatchData.around.tag
            }
        case 2:
            return tableView.dequeueReusableCell(for: indexPath, cellType: BannerTableViewCell.self).then{
                $0.setBannerImage(Image.addZatchBanner)
            }
        case 3:
            return tableView.dequeueReusableCell(for: indexPath, cellType: MainCollectionViewTableViewCell.self).then{
                $0.setTitleAndSubtitle(title: "지금 인기있는 재치", subtitle: "재치 있는 자취인이 되는 법")
                $0.collectionView.initializeDelegate(self)
                $0.collectionView.tag = ZatchData.popular.tag
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

extension MainViewController.ZatchData{
    var tag: Int{
        rawValue
    }
    
    var indexPath: IndexPath{
        switch self{
        case .around:   return [0,1]
        case .popular:  return [0,3]
        }
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch getDataType(of: collectionView){
        case .around:       return viewModel.aroundZatch.count
        case .popular:      return viewModel.popularZatch.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(for: indexPath, cellType: MainZatchCollectionViewCell.self).then{
            $0.viewModel = viewModel
            $0.binding(data: getZatchDataAndType(collectionView, indexPath: indexPath))
        }
    }
    
    private func getZatchDataAndType(_ collectionView: UICollectionView, indexPath: IndexPath) -> (ZatchData, ZatchResponseModel){
        let dataType = getDataType(of: collectionView)
        let zatch: ZatchResponseModel = {
            switch dataType{
            case .around:   return self.viewModel.aroundZatch[indexPath.row]
            case .popular:  return self.viewModel.popularZatch[indexPath.row]
            }
        }()
        return (dataType, zatch)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(ZatchDetailViewController(), animated: true)
    }
    
    private func getDataType(of collectionView: UICollectionView) -> ZatchData{
        guard let type = ZatchData(rawValue: collectionView.tag) else { fatalError() }
        return type
    }
    
    private func reloadZatchCollectionView(type: ZatchData){
        if let cell = mainView.tableView.cellForRow(at: type.indexPath) as? MainCollectionViewTableViewCell{
            cell.collectionView.reloadData()
        }
    }
}
