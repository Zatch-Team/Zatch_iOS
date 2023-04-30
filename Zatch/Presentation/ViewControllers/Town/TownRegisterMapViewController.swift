//
//  TownRegisterMapViewController.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/26.
//

import Foundation

final class TownRegisterMapViewController: MapViewController, Map{
    
    init(){
        super.init(mapService: .town, viewModel: TownRegisterMapViewModel())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let checkTownRegisterAlert = TownMapAlertViewController()
    
    override func bind() {
        
        guard let viewModel = viewModel as? TownRegisterMapViewModel else { return }
        
        let input = TownRegisterMapViewModel.Input(
            locationManager: locationManager,
            registerBtnTap: mainView.nextButton.rx.tap,
            alertBtnTap: checkTownRegisterAlert.okBtn.rx.tap
        )
        
        let output = viewModel.transform(input)
        
        output.isValidLocation
            .subscribe(onNext: { [weak self] _ in
                self?.showRegisterTownFailAlert()
            }).disposed(by: disposeBag)
        
        output.selectTown
            .drive{ [weak self] in
                self?.showAlertAboutLocation(location: $0)
            }.disposed(by: disposeBag)
        
        output.registerResponse
            .subscribe(onNext: { [weak self] code in
                if code == 200 {
                    self?.moveMainViewController()
                }
            }).disposed(by: disposeBag)
        
    }
    
    func willMovePreviousViewController(){
        navigationController?.popViewController(animated: true)
    }

    func showAlertAboutLocation(location: String){
        checkTownRegisterAlert.townName = location
        checkTownRegisterAlert.show(in: self)
    }
    
    private func showRegisterTownFailAlert(){
        Alert.TownCertification.show(in: self)
    }
    
    private func moveMainViewController(){
        navigationController?.pushViewController(MainViewController(), animated: true)
    }
}
