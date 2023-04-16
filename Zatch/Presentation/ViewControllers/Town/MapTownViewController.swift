//
//  TownMapViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/12.
//

import UIKit
import CoreLocation

class MapTownViewController: KakaoMapViewController{
    
    //MARK: - Properties
    var currentLoactionTown: String!
    var townInfo: String! //user의 동네 정보 담는 변수

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func settingAuthorizedState() {
        
        let userTown = locationManager.location?.coordinate
        
//        KakaoLocalDataManager().getsTownLocation(x: String(userTown!.longitude),
//                                                    y: String(userTown!.latitude),
//                                                    viewController: self)
    }

    override func settingBtnDidClicked(){

        guard let mapPoint = self.mapMarker.mapPoint else{
            print("map point value is nil")
            return
        }
        
//        KakaoLocalDataManager().getsTownLocation(x: String( mapPoint.mapPointGeo().longitude),
//                                                    y: String(mapPoint.mapPointGeo().latitude),
//                                                    viewController: self)
    }
    
    func willCertificationUserTown(selectTown: String){
        
        if(currentLoactionTown == selectTown){
            let alert = TownMapAlertViewController()
            alert.townName = self.currentLoactionTown
            alert.completion = {
                print("ok 눌림")
                self.navigationController?.pushViewController(MainViewController(), animated: true)
            }
            alert.modalPresentationStyle = .overFullScreen
            
            self.present(alert, animated: false, completion: nil)
        }else{
            _ = Alert.TownCertification.show(in: self)
        }
    }
    
    //MARK: - API
    
//    func successGetLocationAddress(result: KakaoLocationAddressModel){
//
//        print("현재 위치 주소",result)
//
//        let selectTown = result.documents[1].region_3depth_name
//
//        if (currentLoactionTown == nil){
//            currentLoactionTown = selectTown
//        }else{
//            willCertificationUserTown(selectTown: selectTown)
//        }
//    }
}
