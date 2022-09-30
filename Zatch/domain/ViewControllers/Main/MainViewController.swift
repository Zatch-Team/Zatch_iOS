//
//  MainViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/05.
//

import Foundation

class MainViewController: UIViewController {

    var locationChangeBottomSheet: ChangeLocationBottonSheet?
    var viewModel: MainViewModel!
    let mainView: MainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.tabBarController?.tabBar.tintColor = .zatchPurple
        self.navigationController?.isNavigationBarHidden = true
        
        setMainView()
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.tintColor = .zatchPurple
    }
    // MARK: - Actions
    @objc func arrowTapped(_ sender: UIButton) {setBottomSheet()}
    @objc func buttonTapped(_ sender: UIButton) {setBottomSheet()}
    // MARK: - Functions
    func setMainView() {
        self.view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        self.mainView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action:  #selector(arrowTapped(_:)))
        self.mainView.stackView.addGestureRecognizer(tap)
        self.mainView.arrowButton.addTarget(self, action:  #selector(buttonTapped(_:)), for: .touchUpInside)
        
        viewModel = MainViewModel()
    }
    func setBottomSheet() {
        self.mainView.arrowButton.isSelected = true
        self.mainView.layoutIfNeeded()
        
        locationChangeBottomSheet = ChangeLocationBottonSheet()
        locationChangeBottomSheet?.mainView = self.mainView
        locationChangeBottomSheet?.viewModel = self.viewModel
        let currentLocation = mainView.locationLabel.text!
        locationChangeBottomSheet?.myLocation = currentLocation
        locationChangeBottomSheet!.loadViewIfNeeded()
        self.present(locationChangeBottomSheet!, animated: true, completion: nil)
    }
}
