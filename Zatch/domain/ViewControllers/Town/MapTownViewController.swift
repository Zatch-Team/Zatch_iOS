//
//  TownMapViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/12.
//

import UIKit

class MapTownViewController: UIViewController {
    
    //MARK: - Properties
    var mapMarker = CustomMapMarker()
    
    let mainView = MapTownView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        mainView.mapView.delegate = self
    }
}

extension MapTownViewController: MTMapViewDelegate{
    
    /*
     //1. 지도 상에서 특정 위치 터치 -> singleTapOnMapPoint
     //2. 선택한 위치에 마커 표시 -> addPOIItem (1개만 표시되도록 설정)
     
     3. 재치 시작하기 버튼 클릭시, 마커 위치 정보 통해 '동' 정보 추출하기
     
     추가. customDirectionImageAnchorPointOffset로 마커 중심 변경하기
     */
    
    class CustomMapMarker: MTMapPOIItem{
        
        override init(){
            
            super.init()
            
            self.showAnimationType = .springFromGround
            self.markerType = .customImage
            self.customImage = UIImage(named: "map_marker") //map_marker
        }
        
    }
    
    func mapView(_ mapView: MTMapView!, singleTapOn mapPoint: MTMapPoint!) {
        print("click event")
        
        self.mapMarker.mapPoint = mapPoint
        mapView.remove(self.mapMarker)
        mapView.addPOIItems([self.mapMarker])
        
    }
    
}
