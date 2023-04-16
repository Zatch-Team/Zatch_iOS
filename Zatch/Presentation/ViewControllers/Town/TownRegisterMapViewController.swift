//
//  TownRegisterMapViewController.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/26.
//

import Foundation

class TownRegisterMapViewController: MapViewController, Map{
    
    init(){
        super.init(mapService: .town, viewModel: TownRegisterMapViewModel())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func bind() {
        
        let input = TownRegisterMapViewModel.Input(locationManager: locationManager,
                                                   registerButtonControlEvent: mainView.nextButton.rx.tap)
        
        guard let viewModel = viewModel as? TownRegisterMapViewModel else { return }
        let output = viewModel.transform(input)
        output.isValidLocation
            .subscribe(onNext: { [weak self] _ in
                self?.showRegisterTownFailAlert()
            }).disposed(by: disposeBag)
        
        output.selectTown
            .drive{ [weak self] in
                self?.showAlertAboutLocation(location: $0)
            }.disposed(by: disposeBag)
        
    }
    
    func willMovePreviousViewController(){
        navigationController?.popViewController(animated: true)
    }

    func showAlertAboutLocation(location: String){
        TownMapAlertViewController().then{
            $0.townName = location
        }.show(in: self)
    }
    
    func showRegisterTownFailAlert(){
        Alert.TownCertification.show(in: self)
    }
}
