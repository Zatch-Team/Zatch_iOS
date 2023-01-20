//
//  HiddenZatchInfoView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/16.
//

import UIKit

class HiddenZatchInfoView: UIView {
    
    let productLabel = UILabel().then{
        $0.text = "다른 코스튬 아무거나"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .white
    }
    
    let eclipseView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 1
    }
    
    let eclipseBackView = UIView().then{
        $0.backgroundColor = .transparent
    }
    
    let locationLabel = UILabel().then{
        $0.text = "서대문구 홍제동"
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textColor = .white
    }
    
    let dateLabel = UILabel().then{
        $0.text = "21.07.05"
        $0.font = UIFont.pretendard(size: 13, family: .Medium)
        $0.textColor = .white
    }
    
    let timeLabel = UILabel().then{
        $0.text = "00시00분"
        $0.font = UIFont.pretendard(size: 13, family: .Medium)
        $0.textColor = .white
    }
    
    let remainAppointmentLabel = UILabel().then{
        $0.text = "1일 남음"
        $0.font = UIFont.pretendard(size: 13, family: .Medium)
        $0.textColor = .white
    }
    
    let productImage = UIImageView().then{
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.backgroundColor = .black10
    }
    
    let topStackView = UIStackView().then{
        $0.spacing = 4
        $0.axis = .horizontal
    }
    
    let bottomStackView = UIStackView().then{
        $0.spacing = 12
        $0.axis = .horizontal
    }
    
    let infoStackView = UIStackView().then{
        $0.spacing = 11
        $0.axis = .vertical
        $0.alignment = .leading
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        self.layer.cornerRadius = 80/2
        self.layer.masksToBounds = true
        
        self.addSubview(infoStackView)
        self.addSubview(productImage)
        
        self.eclipseBackView.addSubview(eclipseView)
        
        infoStackView.addArrangedSubview(topStackView)
        infoStackView.addArrangedSubview(bottomStackView)
        
        topStackView.addArrangedSubview(productLabel)
        topStackView.addArrangedSubview(eclipseBackView)
        topStackView.addArrangedSubview(locationLabel)
        
        bottomStackView.addArrangedSubview(dateLabel)
        bottomStackView.addArrangedSubview(timeLabel)
        bottomStackView.addArrangedSubview(remainAppointmentLabel)
        
        self.snp.makeConstraints{ make in
            make.height.equalTo(80)
        }
        
        infoStackView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(24)
            make.bottom.equalToSuperview().offset(-20)
            make.trailing.equalToSuperview().offset(-95)
        }
        
        topStackView.snp.makeConstraints{ make in
            make.height.equalTo(17)
        }
        
        productImage.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-13)
            make.trailing.equalToSuperview().offset(-28)
            make.width.height.equalTo(52)
        }

        eclipseBackView.snp.makeConstraints{ make in
            make.width.equalTo(2)
            make.height.equalTo(17)
        }
        
        eclipseView.snp.makeConstraints{ make in
            make.width.height.equalTo(2)
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setIfZatch(_ isZatch: Bool) {
        if isZatch {self.backgroundColor = .zatchPurple}
        else {self.backgroundColor = .zatchYellow}
    }
    
}
