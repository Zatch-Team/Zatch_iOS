//
//  KakaoMapView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/18.
//

import UIKit

class KakaoMapView: BaseView {
    
    enum ServiceType: String{
        case town = "재치 시작하기"
        case meeting = "약속 잡기"
    }
    
    init(type: ServiceType){
        super.init(frame: .zero)
        nextButton.setTitle(type.rawValue, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backBtnView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 40/2
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 5
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    lazy var backBtn = UIButton().then{
        $0.setImage(Image.townArrow, for: .normal)
    }
    
    let mapView = MTMapView().then{
        $0.baseMapType = .standard
    }
    
    lazy var nextButton = Purple52Button()

    override func hierarchy() {
        addSubview(mapView)
        mapView.addSubview(backBtnView)
        mapView.addSubview(nextButton)
        backBtnView.addSubview(backBtn)
    }
    
    override func layout() {
        backBtnView.snp.makeConstraints{
            $0.width.height.equalTo(40)
            $0.top.equalToSuperview().offset(79)
            $0.leading.equalToSuperview().offset(24)
        }
        
        backBtn.snp.makeConstraints{
            $0.width.height.equalTo(16)
            $0.centerX.centerY.equalToSuperview()
        }
        
        mapView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(86)
            $0.leading.trailing.equalToSuperview().inset(31)
        }
    }

}
