//
//  MapMeetingViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/18.
//

import UIKit

//TODO: WILL DELETE
class MapMeetingViewController: KakaoMapViewController{
    
    //MARK: - Properties
    var navigation: UINavigationController!

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
        
//        KakaoLocalDataManager().getsMeetingLocation(x: String( mapPoint.mapPointGeo().longitude),
//                                                    y: String(mapPoint.mapPointGeo().latitude),
//                                                    viewController: self)
    }
    
    override func backBtnDidClicked() {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - API
    
//    func successGetLocationAddress(result: MeetingRoadAddressResult){
//
//        let alert = MeetingMapAlertViewController()
//
//        let locationString: String!
//        let labelString: String!
//
//        if(result.building_name != ""){
//            locationString = "'\(result.building_name)'"
//            labelString = result.building_name
//        }else{
//            locationString = "\n'\(result.address_name)'"
//            labelString = result.address_name
//        }
//
//        alert.addressName = locationString
//
//        alert.completion = {
//            print("ok 눌림")
//
//            let popViewController = self.navigation.viewControllers[0] as! MakeMeetingSheetViewController
//            print(self.navigation?.viewControllers)
//
//            self.dismiss(animated: false, completion: {
//                self.navigation.popToViewController(viewController: popViewController, completion:{
//                    popViewController.mainView.locationLabel.text = labelString
//                })
//            })
//        }
//        alert.modalPresentationStyle = .overFullScreen
//
//        self.present(alert, animated: false, completion: nil)
//    }
}
