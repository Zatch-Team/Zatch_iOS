//
//  MakeMeetingSheetViewController+Layout.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/01.
//

import UIKit

extension MakeMeetingSheetViewController {
    
    func setUpView(){
        
        self.view.addSubview(backStackView)
        
        backStackView.addArrangedSubview(timeFrame)
        backStackView.addArrangedSubview(locationFrame)
        backStackView.addArrangedSubview(alarmFrame)
        backStackView.addArrangedSubview(makeMeetingBtn)
        
        timeFrame.addSubview(timeTitle)
        timeFrame.addSubview(timeInputView)
        
        timeInputView.addArrangedSubview(dateStackView)
        timeInputView.addArrangedSubview(timeStackView)
        
        dateStackView.addArrangedSubview(monthView)
        dateStackView.addArrangedSubview(dateView)
        
        timeStackView.addArrangedSubview(hourView)
        timeStackView.addArrangedSubview(minuteView)
        
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
            make.top.equalTo(timeTitle.snp.bottom).offset(11)
            make.leading.trailing.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-4)
            make.height.equalTo(24)
        }
        
        dateStackView.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
        }
        
        monthView.snp.makeConstraints{ make in
            make.width.equalTo(45)
            make.top.bottom.equalToSuperview()
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
            make.leading.equalTo(monthLabel)
        }
        
        dateView.snp.makeConstraints{ make in
            make.width.equalTo(45)
            make.top.bottom.equalToSuperview()
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
        
        timeStackView.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
        }
        
        hourView.snp.makeConstraints{ make in
            make.width.equalTo(45)
        }
        
        hourLabel.snp.makeConstraints{ make in
            make.top.leading.bottom.equalToSuperview()
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
