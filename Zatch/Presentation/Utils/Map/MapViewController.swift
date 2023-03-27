//
//  MapViewController.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/26.
//

import Foundation
import CoreLocation
import RxSwift

class MapViewController: UIViewController{
    
    class CustomMapMarker: MTMapPOIItem{
        override init(){
            super.init()
            style()
        }
        
        private func style(){
            showAnimationType = .springFromGround
            markerType = .customImage
            customImage = Image.mapMarker
        }
    }
    
    var locationMarker = CustomMapMarker()
    var locationManager = CLLocationManager()
    let mainView: KakaoMapView
    let viewModel: MapLocationSelectable
    let disposeBag = DisposeBag()
    
    init(mapService: KakaoMapView.ServiceType, viewModel: MapLocationSelectable){
        mainView = KakaoMapView(type: mapService)
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        initialize()
        bind()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        if(locationManager.authorizationStatus == .restricted || locationManager.authorizationStatus == .denied ){
            willShowRestrictedServiceAlert()
        }
    }
    
    private func style(){
        navigationController?.isNavigationBarHidden = true
    }
    
    private func layout(){
        view.addSubview(mainView)
        mainView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func initialize(){
//        locationManager.delegate = self
        checkLocationAuthorizationStatus()
        
        mainView.mapView.delegate = self
        mainView.mapView.currentLocationTrackingMode = .onWithoutHeading // 현 위치 트래킹 모드 on
        mainView.mapView.setZoomLevel(0, animated: true)
    }
    
    func bind(){
        
    }
    
    private func checkLocationAuthorizationStatus(){
        switch (locationManager.authorizationStatus){
        case .authorizedAlways, .authorizedWhenInUse:
            print("이미 허용됨?")
            //따로 안내할 내용 없으니까 건너뛰어도 될 듯
            locationManager.startUpdatingLocation()
            break
        case .notDetermined:
            print("아직 결정안됨?")
            locationManager.requestWhenInUseAuthorization()
            break
        default:
            print("이외?")
        }
    }
    
    private func willShowRestrictedServiceAlert(){
        Alert.LocationAuthority.generateAlert().show(in: self).then{
            $0.completion = { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }
    
}

extension MapViewController: MTMapViewDelegate{
    func mapView(_ mapView: MTMapView!, singleTapOn mapPoint: MTMapPoint!) {
        //map marker 지도에 한 개만 표시되도록 기존 마커 제거 후 새로 추가
        locationMarker.mapPoint = mapPoint
        mapView.remove(locationMarker)
        mapView.addPOIItems([locationMarker])
        viewModel.changeLocationMarker(x: mapPoint.mapPointGeo().longitude,
                                       y: mapPoint.mapPointGeo().latitude)
    }
}
