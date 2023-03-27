//
//  MeetingLocationRegisterMapViewController.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/27.
//

import Foundation

class MeetingLocationRegisterMapViewController: MapViewController, Map{
    
    init(){
        super.init(mapService: .meeting, viewModel: TownRegisterMapViewModel())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func willMovePreviousViewController() {
        
    }
    
    func showAlertAboutLocation(location: String) {
        
    }
}
