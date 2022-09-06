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
    var mainView: MainView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.tabBarController?.tabBar.tintColor = .zatchPurple
        
        mainView = MainView()
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        viewModel = MainViewModel()
        
        self.mainView.isUserInteractionEnabled = true
        self.mainView.arrowButton.addTarget(self, action: #selector(arrowTapped(_:)), for: .touchUpInside)
        setBottomSheet()    //임시로
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.tintColor = .zatchPurple
    }
    // MARK: - Actions
    @objc func arrowTapped(_ sender: AnyObject?) {
        print("location clicked!")
        setBottomSheet()
    }
    func setBottomSheet() {
        // 화살표 방향 안 바뀜
        self.mainView.arrowButton.setImage(UIImage(named: ""), for: .normal)
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
