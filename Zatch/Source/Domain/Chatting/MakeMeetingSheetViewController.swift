//
//  MakeMeetingSheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/31.
//

import UIKit

class MakeMeetingSheetViewController: SheetViewController {
    
    //MARK: - UI
    let timeTitle = UILabel().then{
        $0.text = "약속 시간"
        $0.font = UIFont.pretendard(size: 15, family: .Bold)
        $0.textColor = .black85
    }
    
    let monthTitle = UILabel().then{
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.text = "월"
        $0.textColor = .black
    }
    
    let dateTitle = UILabel().then{
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.text = "일"
        $0.textColor = .black
    }
    
    let hourTitle = UILabel().then{
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.text = "시"
        $0.textColor = .black
    }
    
    let minuteTitle = UILabel().then{
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.text = "분"
        $0.textColor = .black
    }
    
    let monthLabel = UILabel().then{
        $0.textColor = .zatchPurple
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textAlignment = .center
    }
    let dateLabel = UILabel().then{
        $0.textColor = .zatchPurple
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textAlignment = .center
    }
    
    let hourLabel = UILabel().then{
        $0.textColor = .zatchPurple
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textAlignment = .center
    }
    
    let minuteLabel = UILabel().then{
        $0.textColor = .zatchPurple
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textAlignment = .center
    }
    
    let monthBorderLine = UILabel().then{
        $0.backgroundColor = .black5
    }
    
    let dateBorderLine = UILabel().then{
        $0.backgroundColor = .black5
    }
    
    let hourBorderLine = UILabel().then{
        $0.backgroundColor = .black5
    }
    
    let minuteBorderLine = UILabel().then{
        $0.backgroundColor = .black5
    }
    
    let timeInputView = UIView()
    
    let monthView = UIView()
    let dateView = UIView()
    let hourView = UIView()
    let minuteView = UIView()
    
    let locationTitle = UILabel().then{
        $0.text = "약속 장소"
        $0.font = UIFont.pretendard(size: 15, family: .Bold)
        $0.textColor = .black85
    }
    
    let locationLabel = UILabel()
    
    let searchImage = UIImageView().then{
        $0.image = UIImage(named: "search")
        $0.tintColor = .black10
    }
    
    let locationBorderLine = UIView().then{
        $0.backgroundColor = .black10
    }
    
    let locationInputView = UIView()
    
    let alaramTitle = UILabel().then{
        $0.text = "알림 설정"
        $0.font = UIFont.pretendard(size: 15, family: .Bold)
        $0.textColor = .black85
    }
    
    let alarmSwitch = UISwitch()
    
    let makeMeetingBtn = PurpleButton().then{
        $0.setTitle("약속잡기", for: .normal)
    }
    let backStackView = UIStackView().then{
        $0.axis = .vertical
        $0.spacing = 28
        $0.distribution = .equalCentering
    }
    
    let timeFrame = UIView()
    let locationFrame = UIView()
    let alarmFrame = UIView()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        super.sheetType = .MakeMeeting
        super.titleLabel.removeFromSuperview()
        
        setUpView()
        setUpConstraint()
    }
    
    func setUpView(){
        
        self.view.addSubview(backStackView)
        
        backStackView.addArrangedSubview(timeFrame)
        backStackView.addArrangedSubview(locationFrame)
        backStackView.addArrangedSubview(alarmFrame)
        backStackView.addArrangedSubview(makeMeetingBtn)
        
        timeFrame.addSubview(timeTitle)
        timeFrame.addSubview(timeInputView)
        
        timeInputView.addSubview(monthView)
        timeInputView.addSubview(dateView)
        timeInputView.addSubview(hourView)
        timeInputView.addSubview(minuteView)
        
        monthView.addSubview(monthTitle)
        monthView.addSubview(monthLabel)
        monthView.addSubview(monthBorderLine)
        
        dateView.addSubview(dateTitle)
        dateView.addSubview(dateLabel)
        dateView.addSubview(dateBorderLine)
        
        hourView.addSubview(hourTitle)
        hourView.addSubview(hourLabel)
        hourView.addSubview(hourBorderLine)
        
        minuteView.addSubview(minuteTitle)
        minuteView.addSubview(minuteLabel)
        minuteView.addSubview(minuteBorderLine)
        
        locationFrame.addSubview(locationTitle)
        locationFrame.addSubview(locationInputView)
        
        locationInputView.addSubview(locationLabel)
        locationInputView.addSubview(locationBorderLine)
        locationInputView.addSubview(searchImage)
        
        alarmFrame.addSubview(alaramTitle)
        alarmFrame.addSubview(alarmSwitch)
    }
    
    func setUpConstraint(){
        
        backStackView.snp.makeConstraints{ make in
            make.top.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-24)
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
            make.top.equalTo(timeTitle.snp.bottom).offset(3)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(36)
        }
        
        monthView.snp.makeConstraints{ make in
            make.width.equalTo(45)
            make.leading.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-4)
        }
        
        monthLabel.snp.makeConstraints{ make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(28)
        }
        
        monthTitle.snp.makeConstraints{ make in
            make.leading.equalTo(monthLabel.snp.trailing).offset(4)
            make.top.bottom.trailing.equalToSuperview()
        }
        
        monthBorderLine.snp.makeConstraints{ make in
            make.height.equalTo(1.2)
            make.bottom.equalToSuperview()
            make.width.equalTo(monthLabel)
        }
        
        dateView.snp.makeConstraints{ make in
            make.width.equalTo(45)
            make.leading.equalTo(monthView.snp.trailing).offset(13)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-4)
        }
        
        dateLabel.snp.makeConstraints{ make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(28)
        }
        
        dateTitle.snp.makeConstraints{ make in
            make.leading.equalTo(dateLabel.snp.trailing).offset(4)
            make.top.bottom.trailing.equalToSuperview()
        }
        
        dateBorderLine.snp.makeConstraints{ make in
            make.height.equalTo(1.2)
            make.bottom.equalToSuperview()
            make.width.equalTo(monthLabel)
            make.leading.equalTo(dateLabel)
        }
        
        hourView.snp.makeConstraints{ make in
            make.width.equalTo(45)
            make.leading.equalTo(dateView.snp.trailing).offset(36)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-4)
        }
        
        hourLabel.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.width.equalTo(28)
        }
        
        hourTitle.snp.makeConstraints{ make in
            make.leading.equalTo(hourLabel.snp.trailing).offset(4)
            make.top.bottom.trailing.equalToSuperview()
        }
        
        hourBorderLine.snp.makeConstraints{ make in
            make.height.equalTo(1.2)
            make.bottom.equalToSuperview()
            make.width.equalTo(monthLabel)
            make.leading.equalTo(hourLabel)
        }
        
        minuteView.snp.makeConstraints{ make in
            make.width.equalTo(45)
            make.leading.equalTo(hourView.snp.trailing).offset(13)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-4)
        }
        
        minuteLabel.snp.makeConstraints{ make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(28)
        }
        
        minuteTitle.snp.makeConstraints{ make in
            make.leading.equalTo(minuteLabel.snp.trailing).offset(4)
            make.top.bottom.trailing.equalToSuperview()
        }
        
        minuteBorderLine.snp.makeConstraints{ make in
            make.height.equalTo(1.2)
            make.bottom.equalToSuperview()
            make.width.equalTo(monthLabel)
            make.leading.equalTo(minuteLabel)
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
            make.top.equalTo(locationTitle.snp.bottom).offset(3)
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(36)
        }
        
        locationLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview().offset(-11)
        }
        
        locationBorderLine.snp.makeConstraints{ make in
            make.leading.trailing.equalTo(locationLabel)
            make.bottom.equalToSuperview().offset(-8)
            make.height.equalTo(1.2)
        }
        
        searchImage.snp.makeConstraints{ make in
            make.width.height.equalTo(20)
            make.trailing.equalToSuperview().offset(-32)
            make.top.equalToSuperview().offset(4)
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
        
        makeMeetingBtn.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(54)
            make.trailing.equalToSuperview().offset(-54)
        }
    }

}
