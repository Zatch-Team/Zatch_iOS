//
//  MapMeetingViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/18.
//

import UIKit

class MapMeetingViewController: KakaoMapViewController{
    
    //MARK: - Properties

    //TODO: - 약속 장소 설정
    /*
     
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func settingBtnDidClicked(){

        guard let mapPoint = self.mapMarker.mapPoint else{
            print("map point value is nil")
            return
        }
        
        KakaoLocalDataManager().getsMeetingLocation(x: String( mapPoint.mapPointGeo().longitude),
                                                    y: String(mapPoint.mapPointGeo().latitude),
                                                    viewController: self)
    }
    
    override func backBtnDidClicked() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func willDetermineMeetingLocation(){
        
//        let alert = TownMapAlertViewController()
//        alert.townName = self.currentLoactionTown
//        alert.registerHandler = {
//            print("ok 눌림")
//            self.navigationController?.pushViewController(MainViewController(), animated: true)
//        }
//        alert.modalPresentationStyle = .overFullScreen
//
//        self.present(alert, animated: false, completion: nil)
    }
    
    //MARK: - API
    
    func successGetLocationAddress(result: KakaoLocalMeetingModel){
        print("현재 위치 주소",result.documents[0].road_address.building_name, result.documents[0].road_address.address_name)
    
    }
}
