//
//  KakaoMapView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/18.
//

import UIKit

class KakaoMapView: UIView {

    let backBtnView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 40/2
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 5
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    lazy var backBtn = UIButton().then{
        $0.setImage(UIImage(named: "town_arrow"), for: .normal)
    }
    
    let mapView = MTMapView().then{
        $0.baseMapType = .standard
    }
    
    lazy var settingBtn = Purple52Button().then{
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 8
        $0.layer.shadowOffset = CGSize(width: 0, height: 2)
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUpView()
        setUpConstriant()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpView(){
        
        self.addSubview(mapView)
        
        mapView.addSubview(backBtnView)
        mapView.addSubview(settingBtn)
        
        backBtnView.addSubview(backBtn)
        
    }
    
    func setUpConstriant(){
        
        backBtnView.snp.makeConstraints{
            $0.width.height.equalTo(40)
            $0.top.equalToSuperview().offset(88)
            $0.leading.equalToSuperview().offset(35)
        }
        
        backBtn.snp.makeConstraints{
            $0.width.height.equalTo(16)
            $0.centerX.centerY.equalToSuperview()
        }
        
        mapView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        settingBtn.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-86)
            $0.leading.equalToSuperview().offset(31)
            $0.trailing.equalToSuperview().offset(-31)
        }
    }

}
