//
//  MeetingSheetView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/07.
//

import UIKit

class MeetingSheetView: UIView {
    
    //MARK: - UI
    let timeFrame = UIStackView().then{
        $0.spacing = 3
        $0.axis = .vertical
    }
    
    let timeTitle = UILabel().then{
        $0.text = "약속 시간"
    }
    let timeInputView = UIView()
    
    let locationFrame = UIStackView().then{
        $0.spacing = 3
        $0.axis = .vertical
    }
    
    let locationTitle = UILabel().then{
        $0.text = "약속 장소"
    }
    
    let locationInputView = UIView()
    
    let alarmFrame = UIView()
    
    let alaramTitle = UILabel().then{
        $0.text = "알림 설정"
    }
    
    let alarmSwitch = UISwitch().then{
        $0.onTintColor = .zatchPurple
    }
    
    lazy var registerBtn = Purple36Button()
    
    let backStackView = UIStackView().then{
        $0.axis = .vertical
        $0.spacing = 28
        $0.distribution = .equalCentering
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUpView()
        setUpConstraint()
        setUpViewProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        self.addSubview(backStackView)
        
        backStackView.addArrangedSubview(timeFrame)
        backStackView.addArrangedSubview(locationFrame)
        backStackView.addArrangedSubview(alarmFrame)
        backStackView.addArrangedSubview(registerBtn)
        
        timeFrame.addArrangedSubview(timeTitle)
        timeFrame.addArrangedSubview(timeInputView)
        
        locationFrame.addArrangedSubview(locationTitle)
        locationFrame.addArrangedSubview(locationInputView)
        
        alarmFrame.addSubview(alaramTitle)
        alarmFrame.addSubview(alarmSwitch)
    }
    
    func setUpConstraint(){
        
        backStackView.snp.makeConstraints{ make in
            make.top.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
        }
        
        timeFrame.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        timeTitle.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(3)
            make.leading.equalToSuperview().offset(8)
        }
        
        timeInputView.snp.makeConstraints{ make in
            make.height.equalTo(36)
        }

        locationFrame.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        locationTitle.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(3)
            make.leading.equalToSuperview().offset(8)
        }
        
        locationInputView.snp.makeConstraints{ make in
            make.height.equalTo(36)
        }
        
        alarmFrame.snp.makeConstraints{ make in
            make.height.equalTo(24)
            make.leading.trailing.equalToSuperview()
        }

        alaramTitle.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(3)
        }
        
        alarmSwitch.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-14)
            make.centerY.equalToSuperview()
        }
        
        registerBtn.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(54)
            make.trailing.equalToSuperview().offset(-54)
        }
    }
    
    func setUpViewProperties(){
        [timeTitle, locationTitle, alaramTitle].forEach { each in
            each.font = UIFont.pretendard(size: 15, family: .Bold)
            each.textColor = .black85
        }
    }
}
