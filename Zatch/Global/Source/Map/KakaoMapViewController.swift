//
//  KakaoMapViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/18.
//

import UIKit
import CoreLocation

class KakaoMapViewController: UIViewController {
    
    //MARK: - Properties
    var mapMarker = CustomMapMarker()
    
    var locationManager: CLLocationManager!
    
    let mainView = MapTownView().then{
//        $0.backBtn.addTarget(self, action: #selector(backButtonDidClicked), for: .touchUpInside)
        $0.settingBtn.addTarget(self, action: #selector(settingBtnDidClicked), for: .touchUpInside)
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        setUpView()
        
        //TODO: - Authorization Status에 따라 권한 요청 진행하기 (CLAuthorizationStatus)

        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        switch (locationManager.authorizationStatus){
            
        case .authorizedAlways, .authorizedWhenInUse:
            print("이미 허용됨?")
            //따로 안내할 내용 없으니까 건너뛰어도 될 듯
            locationManager.startUpdatingLocation()
            settingAuthorizedState()
            break
        case .notDetermined:
            print("아직 결정안됨?")
            locationManager.requestWhenInUseAuthorization()
            break
        default:
            print("이외?")
        }
         
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        
        if(locationManager.authorizationStatus == .restricted || locationManager.authorizationStatus == .denied ){
            
            let alert = Alert.LocationAuthority.generateAlert().show(in: self)
            alert.completion = {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func setUpView(){
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        mainView.mapView.delegate = self
        mainView.mapView.currentLocationTrackingMode = .onWithoutHeading // 현 위치 트래킹 모드 on
        mainView.mapView.setZoomLevel(0, animated: true)
        
    }
    
    @objc func backBtnDidClicked(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func settingBtnDidClicked(){
    }
    
    func settingAuthorizedState(){
    }

}

extension KakaoMapViewController: MTMapViewDelegate{
    
    /*
     //1. 지도 상에서 특정 위치 터치 -> singleTapOnMapPoint
     //2. 선택한 위치에 마커 표시 -> addPOIItem (1개만 표시되도록 설정)
     
     //3. 카카오 로컬 api 통해 좌표로 주소 변환하기 or MTMapReverseGeoCoder 사용
     //4. 재치 시작하기 버튼 클릭시, 마커 위치 정보 통해 '동' 정보 추출하기
     
     5. 현재 위치와 비교하는 방식으로 동네 인증 기능 구현 -> 법정동 기준으로 진행 => 사용자가 선택한 위치에 대해서도 카카오 로컬 API 호출해야 함
     
     추가. customDirectionImageAnchorPointOffset로 마커 중심 변경하기
     */
    
    class CustomMapMarker: MTMapPOIItem{
        
        override init(){
            
            super.init()
            
            self.showAnimationType = .springFromGround
            self.markerType = .customImage
            self.customImage = Image.mapMarker
        }
        
    }
    
    func mapView(_ mapView: MTMapView!, singleTapOn mapPoint: MTMapPoint!) {
        
        //map marker 지도에 한 개만 표시되도록 기존 마커 제거 후 새로 추가
        self.mapMarker.mapPoint = mapPoint
        mapView.remove(self.mapMarker)
        mapView.addPOIItems([self.mapMarker])
    }
    
}

extension KakaoMapViewController: CLLocationManagerDelegate{
    
    /*
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager){
        print("새로운 권한", manager.authorizationStatus, manager.authorizationStatus.rawValue)
        switch (manager.authorizationStatus){
        case .authorizedAlways, .authorizedWhenInUse:
            //따로 안내할 내용 없으니까 건너뛰어도 될 듯
            print("새로 허용됨")
            manager.startUpdatingLocation()
            let userTown = manager.location?.coordinate
            
            KakaoLocalDataManager().getsLocationAddress(x: String(userTown!.longitude),
                                                        y: String(userTown!.latitude),
                                                        viewController: self)
            break
            
        case .denied, .restricted:
            print("새로 접근 허용 물었는데 거부됨?")
            //위치 권한을 허용하셔야 동네 인증이 가능합니다. 팝업 띄우기
            let alert = InfoAlertViewController(message: "위치 권한을 허용하셔야 동네 인증이 가능합니다.")
            alert.handler = {
                self.navigationController?.popViewController(animated: true)
            }
            alert.modalPresentationStyle = .overFullScreen
            self.present(alert, animated: false, completion: nil)
            break
            
        default:
            print("이외 케이스??")
            return
        }
    }
     */
}

