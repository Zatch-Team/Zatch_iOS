//
//  MapMeetingViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/18.
//

import UIKit

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
        
        KakaoLocalDataManager().getsMeetingLocation(x: String( mapPoint.mapPointGeo().longitude),
                                                    y: String(mapPoint.mapPointGeo().latitude),
                                                    viewController: self)
    }
    
    override func backBtnDidClicked() {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - API
    
    func successGetLocationAddress(result: MeetingRoadAddressResult){
        
        //TODO: - alert ok 클릭시 선택한 장소 makemeetingsheetVC로 데이터 옮겨야
        let alert = MeetingMapAlertViewController()
        alert.addressName = result.building_name
        alert.registerHandler = {
            print("ok 눌림")

            let popViewController = self.navigation.viewControllers[0] as! MakeMeetingSheetViewController
            print(self.navigation?.viewControllers)
            self.dismiss(animated: false, completion: {
                //navigation 저장해놓고 특정 vc로 pop?
                self.navigation.popToViewController(viewController: popViewController, completion:{ popViewController.mainView.locationLabel.text = result.building_name
                })
            })
        }
        alert.modalPresentationStyle = .overFullScreen

        self.present(alert, animated: false, completion: nil)
    }
}
