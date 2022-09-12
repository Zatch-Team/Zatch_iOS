//
//  TownMapView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/12.
//

import UIKit

class MapTownView: UIView {
    
    let backBtnView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 40/2
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 5
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    let backBtn = UIButton().then{
        $0.setImage(UIImage(named: "town_arrow"), for: .normal)
    }
    
    let townSettingBtn = PurpleButton(height: 52, fontSize: 18).then{
        $0.setTitle("재치 시작하기", for: .normal)
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
        self.addSubview(backBtnView)
        self.addSubview(townSettingBtn)
        
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
        
        townSettingBtn.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-86)
            $0.leading.equalToSuperview().offset(31)
            $0.trailing.equalToSuperview().offset(-31)
        }
    }
}
