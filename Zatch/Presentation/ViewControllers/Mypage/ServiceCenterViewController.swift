//
//  ServiceCenterViewController.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/26.
//

import Foundation
import RxRelay

final class ServiceCenterViewController: BaseViewController<CenterNavigationHeaderView, ServiceCenterView> {
    
    init(){
        super.init(
            headerView: CenterNavigationHeaderView(title: "고객센터"),
            mainView: ServiceCenterView()
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum ServiceCenter: Int{
        case zatch = 0
        case search
        case town
        case account
    }
    
    struct FAQ: Decodable{
        struct Data: Decodable{
            let title: String
            let content: String
        }
        let zatch: [FAQ.Data]
        let search: [FAQ.Data]
        let town: [FAQ.Data]
        let account: [FAQ.Data]
    }
    
    private var underLineConstraints: [NSLayoutConstraint]!
    private var faq: FAQ!
    private var isContentOpen: [Bool]!
    private var selectServiceCell: ServiceTitleCollectionViewCell!{
        willSet{
            selectServiceCell?.isSelect = false
        }
        didSet{
            selectServiceCell.isSelect = true
        }
    }
    
    
    private let selectServiceRelay = BehaviorRelay<Int>(value: 0)
    private lazy var selectCellUnderLine = UIView().then{
        $0.backgroundColor = .zatchPurple
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collectionView(mainView.serviceCollectionView, didSelectItemAt: [0,0])
    }
    
    override func initialize() {
        super.initialize()
        getFAQ()
        initializeDelegate()
    }
    
    override func layout() {
        super.layout()
        view.addSubview(selectCellUnderLine)
        selectCellUnderLine.snp.makeConstraints{
            $0.height.equalTo(1.5)
            $0.bottom.equalTo(mainView.serviceCollectionView).inset(12)
        }
    }
    
    private func initializeDelegate(){
        mainView.serviceCollectionView.initializeDelegate(self)
        mainView.faqTableView.initializeDelegate(self)
    }
    
    override func bind() {
        selectServiceRelay
            .subscribe(onNext: { [weak self] in
                self?.isContentOpen = [Bool](repeating: false, count: self?.getListOfFAQ(serviceId: $0).count ?? 0)
                self?.mainView.faqTableView.reloadData()
            }).disposed(by: disposeBag)
    }
    
    private func getFAQ(){
        guard let path = Bundle.main.path(forResource: "FAQ", ofType: "json"),
              let jsonString = try? String(contentsOfFile: path),
              let data = jsonString.data(using: .utf8),
              let faqData = try? JSONDecoder().decode(FAQ.self, from: data) else { fatalError() }

        faq = faqData
    }
}

extension ServiceCenterViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ServiceTitleCollectionViewCell.self).then{
            $0.title = getServiceTitle(row: indexPath.row)
        }
        if indexPath.row == 0 {
            selectServiceCell = cell
        }
        return cell
    }
    
    private func getServiceTitle(row: Int) -> String{
        switch row{
        case 0:     return "재치"
        case 1:     return "검색"
        case 2:     return "동네"
        case 3:     return "계정"
        default:    fatalError("고객 센터 타이틀 indexpath error")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectServiceCell = collectionView.cellForItem(at: indexPath, cellType: ServiceTitleCollectionViewCell.self)
        selectServiceRelay.accept(indexPath.row)
        changeSelectCellUnderLineLayout()
    }
    
    private func changeSelectCellUnderLineLayout(){
        defer {
            animateChangeUnderLineLayout()
        }
        
        selectCellUnderLine.translatesAutoresizingMaskIntoConstraints = false
        
        if underLineConstraints != nil {
            NSLayoutConstraint.deactivate(underLineConstraints)
        }
        
        underLineConstraints = [
            selectCellUnderLine.leadingAnchor.constraint(equalTo: selectServiceCell.leadingAnchor),
            selectCellUnderLine.trailingAnchor.constraint(equalTo: selectServiceCell.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(underLineConstraints)
    }
    
    private func animateChangeUnderLineLayout(){
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

extension ServiceCenterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        getListOfFAQ(serviceId: selectServiceRelay.value).count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isContentOpen[section] ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let faq = getListOfFAQ(serviceId: selectServiceRelay.value)[indexPath.section]

        switch indexPath.row{
        case 0:     return getTitleTableViewCell(indexPath: indexPath, faq: faq)
        case 1:     return getContentTableViewCell(indexPath: indexPath, faq: faq)
        default:    fatalError()
        }
    }
    
    private func getTitleTableViewCell(indexPath: IndexPath, faq: FAQ.Data) -> FAQTitleTableViewCell {
        mainView.faqTableView.dequeueReusableCell(for: indexPath, cellType: FAQTitleTableViewCell.self).then{
            $0.title = faq.title
            $0.isContentOpen = isContentOpen[indexPath.section]
        }
    }
    
    private func getContentTableViewCell(indexPath: IndexPath, faq: FAQ.Data) -> FAQContentTableViewCell {
        mainView.faqTableView.dequeueReusableCell(for: indexPath, cellType: FAQContentTableViewCell.self).then{
            $0.titleLabel.text = faq.title
            $0.commentLabel.text = faq.content
        }
    }
    
    private func getListOfFAQ(serviceId: Int) -> [FAQ.Data]{
        switch ServiceCenter(rawValue: serviceId){
        case .zatch:        return faq.zatch
        case .search:       return faq.search
        case .town:         return faq.town
        case .account:      return faq.account
        default:            fatalError()
        }
    }
    
    private func getFAQData(indexPath: IndexPath) -> FAQ.Data{
        getListOfFAQ(serviceId: indexPath.section)[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0 { return }
        
        isContentOpen[indexPath.section].toggle()
        
        toggleArrow(indexPath: indexPath)
        reloadCell(section: indexPath.section)
    }
    
    private func toggleArrow(indexPath: IndexPath){
        mainView.faqTableView.cellForRow(
            at: indexPath,
            cellType: FAQTitleTableViewCell.self
        )?.isContentOpen = isContentOpen[indexPath.section]
    }
    
    private func reloadCell(section: Int){
        isContentOpen[section]
        ? mainView.faqTableView.insertRows(at: [[section, 1]], with: .fade)
        : mainView.faqTableView.deleteRows(at: [[section, 1]], with: .fade)
    }
}
