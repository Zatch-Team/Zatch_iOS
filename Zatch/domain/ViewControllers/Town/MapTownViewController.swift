//
//  TownMapViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/12.
//

import UIKit

class MapTownViewController: UIViewController{
    
    //MARK: - Properties
    var mapMarker = CustomMapMarker()
    var geocoder: MTMapReverseGeoCoder!
    
    //MARK: - UI
    
    let mainView = MapTownView().then{
        $0.townSettingBtn.addTarget(self, action: #selector(willCertificationUserTown), for: .touchUpInside)
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        mainView.mapView.delegate = self
    }
    
    @objc func willCertificationUserTown(){
        print("certification start button click")
    }
}

extension MapTownViewController: MTMapViewDelegate{
    
    /*
     //1. 지도 상에서 특정 위치 터치 -> singleTapOnMapPoint
     //2. 선택한 위치에 마커 표시 -> addPOIItem (1개만 표시되도록 설정)
     
     3. 카카오 로컬 api 통해 좌표로 주소 변환하기 or MTMapReverseGeoCoder 사용
     4. 재치 시작하기 버튼 클릭시, 마커 위치 정보 통해 '동' 정보 추출하기
     
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
