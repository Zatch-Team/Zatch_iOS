//
//  TownMapViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/12.
//

import UIKit
import CoreLocation

class MapTownViewController: UIViewController{
    
    //MARK: - Properties
    var mapMarker = CustomMapMarker()
    
    var townInfo: String! //user의 동네 정보 담는 변수
    
    //MARK: - UI
    
    let mainView = MapTownView().then{
        $0.townSettingBtn.addTarget(self, action: #selector(willCertificationUserTown), for: .touchUpInside)
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        setUpView()
        
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let userTown = locationManager.location?.coordinate
        print("현재 위치",userTown!.latitude, userTown?.longitude)
    }
    
    func setUpView(){
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        mainView.mapView.delegate = self
//        mainView.mapView.currentLocationTrackingMode = .onWithoutHeading // 현 위치 트래킹 모드 on
        mainView.mapView.setZoomLevel(0, animated: true)
        
    }
    
    @objc func willCertificationUserTown(){

        guard let mapPoint = self.mapMarker.mapPoint else{
            print("map point value is nil")
            return
        }

        //좌표 -> 주소 변환 메서드
        MTMapReverseGeoCoder.executeFindingAddress(for: mapPoint, openAPIKey: Const.KakaoAPI.KAKAO_APP_KEY, completionHandler: {isSuccess, address, error in
            if(isSuccess){
                if let address = address {
                    self.addressProcessing(address: address)
                }
            }
        })
    }
    
    func addressProcessing(address: String){
        
        /* 동네 정보 전체 주소 케이스 5가지(동,면,읍,가)
         3: 경기 성남시 분당구 정자동 112
         2: 서울 성북구 안암동5가 1-2
         2: 서울 동대문구 전농동 130-14
         2: 경기 화성시 정남면 발산리 455-1
         2: 충남 아산시 배방읍 회룡리 산 16
         */
        
        print(address)
        
        let tokenString = address.components(separatedBy: " ")
        let endCharacter = tokenString[2].returnEndCharacter()
        
        if(endCharacter == "동" || endCharacter == "면" || endCharacter == "읍" || endCharacter == "가"){
            print("2번 인덱스")
            self.townInfo = tokenString[2]
        }else if(tokenString[3].returnEndCharacter() == "동"){
            print("3번 인덱스")
            self.townInfo = tokenString[3]
        }else{
            
        }
        
        let alert = MapAlertViewController()
        alert.townName = townInfo
        
        alert.modalPresentationStyle = .overFullScreen
        self.present(alert, animated: false, completion: nil)
        
        
    }
}

extension MapTownViewController: MTMapViewDelegate{
    
    /*
     //1. 지도 상에서 특정 위치 터치 -> singleTapOnMapPoint
     //2. 선택한 위치에 마커 표시 -> addPOIItem (1개만 표시되도록 설정)
     
     //3. 카카오 로컬 api 통해 좌표로 주소 변환하기 or MTMapReverseGeoCoder 사용
     //4. 재치 시작하기 버튼 클릭시, 마커 위치 정보 통해 '동' 정보 추출하기
     
     5. 현재 위치와 비교하는 방식으로 동네 인증 기능 구현
     
     추가. customDirectionImageAnchorPointOffset로 마커 중심 변경하기
     */
    
    class CustomMapMarker: MTMapPOIItem{
        
        override init(){
            
            super.init()
            
            self.showAnimationType = .springFromGround
            self.markerType = .customImage
            self.customImage = UIImage(named: "map_marker")
        }
        
    }
    
    func mapView(_ mapView: MTMapView!, singleTapOn mapPoint: MTMapPoint!) {
        
        //map marker 지도에 한 개만 표시되도록 기존 마커 제거 후 새로 추가
        self.mapMarker.mapPoint = mapPoint
        mapView.remove(self.mapMarker)
        mapView.addPOIItems([self.mapMarker])
    }
    
}

extension MapTownViewController: CLLocationManagerDelegate{

}
