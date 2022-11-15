//
//  MakeMeetingSheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/31.
//

import UIKit
import RxCocoa
import RxSwift

class MakeMeetingSheetViewController: SheetViewController {
    
    let mainView = MakeMeetingSheetView().then{
        $0.registerBtn.addTarget(self, action: #selector(registerBtnDidClicked), for: .touchUpInside)
        $0.alarmSwitch.addTarget(self, action: #selector(alarmSwitchWillChange), for: .valueChanged)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Override
    
    override func style(){
        
        super.style()
        
        //TODO: - Type 지정이 바꿔야 할 듯?
        self.setBottomSheetStyle(type: .MakeMeeting)
    }
    
    override func initialize() {
        
        super.initialize()
        
        let locationTap = UITapGestureRecognizer(target: self, action: #selector(willLocationSearchSheetOpen))
        mainView.locationLabel.addGestureRecognizer(locationTap)

        let timeTap = UITapGestureRecognizer(target: self, action: #selector(timePickerWillAppear))
        mainView.timeStackView.addGestureRecognizer(timeTap)
    }
    
    override func layout() {
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-23)
        }
    }
    
    @objc func timePickerWillAppear(){
        
        let picker = TimePickerAlertViewController()
        
        picker.pickerHandler = { array in
            self.mainView.hourView.timeLabel.text = String(array[0])
            self.mainView.minuteView.timeLabel.text = String(array[1])
        }
        
        picker.modalPresentationStyle = .overFullScreen
        picker.loadViewIfNeeded()
        self.present(picker, animated: false, completion: nil)
    }
    
    @objc func willLocationSearchSheetOpen(){
        let vc = SearchAddressSheetViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func registerBtnDidClicked(){
        self.dismiss(animated: true, completion: nil)
    }

    @objc func alarmSwitchWillChange(_ sender: UISwitch){
    
        if(sender.isOn){
            _ = Alert.AlarmInfo.generateAlert().show(in: self)
        }
    }
}
