//
//  MainViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/05.
//

import Foundation

class MainViewController: UIViewController {
    var locationChangeBottomSheet: ChangeLocationSheetViewController?
//    var viewModel: MainViewModel!
    let mainView: MainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.tabBarController?.tabBar.tintColor = .zatchPurple
        self.navigationController?.isNavigationBarHidden = true
        
        setMainView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        self.tabBarController?.tabBar.tintColor = .zatchPurple
//    }
    // MARK: - Actions
    @objc func arrowTapped(_ sender: UIButton) {setBottomSheet()}
    @objc func buttonTapped(_ sender: UIButton) {setBottomSheet()}
    @objc func goSearchButtonDidTap() {
        let vc = MySearchViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func goNotiButtonDidTap() {
        let vc = NotificationViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    // MARK: - Functions
    func setMainView() {
        self.view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        mainView.setUpTableView(dataSouceDelegate: self)
        mainView.setUpView()
        mainView.setUpConstraint()
        self.mainView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action:  #selector(arrowTapped(_:)))
        self.mainView.stackView.addGestureRecognizer(tap)
        self.mainView.arrowButton.addTarget(self, action:  #selector(buttonTapped(_:)), for: .touchUpInside)
        self.mainView.searchButton.addTarget(self, action: #selector(goSearchButtonDidTap), for: .touchUpInside)
        self.mainView.notiButton.addTarget(self, action: #selector(goNotiButtonDidTap), for: .touchUpInside)
        
//        viewModel = MainViewModel()
    }
    func setBottomSheet() {
        self.mainView.arrowButton.isSelected = true
        self.mainView.layoutIfNeeded()
        
        locationChangeBottomSheet = ChangeLocationSheetViewController()
        locationChangeBottomSheet?.mainView = self.mainView
//        locationChangeBottomSheet?.viewModel = self.viewModel
        let currentLocation = mainView.locationLabel.text!
        locationChangeBottomSheet?.myLocation = currentLocation
        locationChangeBottomSheet!.loadViewIfNeeded()
        self.present(locationChangeBottomSheet!, animated: true, completion: nil)
    }
}
// MARK: - Main TableView delegate
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
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
            cell.then{
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
            cell.then{
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
        case 0:
            let vc = ResultSearchViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = FirstRegisterViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            fatalError()
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier,
                                                            for: indexPath)
                as? MainCollectionViewCell else{ fatalError() }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ZatchDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
