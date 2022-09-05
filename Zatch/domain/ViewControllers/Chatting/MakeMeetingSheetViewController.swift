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
    }
    
    let monthTitle = UILabel().then{
        $0.text = "월"
    }
    
    let dateTitle = UILabel().then{
        $0.text = "일"
    }
    
    let hourTitle = UILabel().then{
        $0.text = "시"
    }
    
    let minuteTitle = UILabel().then{
        $0.text = "분"
    }
    
    let monthLabel = UILabel()
    let dateLabel = UILabel()
    let hourLabel = UILabel()
    let minuteLabel = UILabel()
    
    let monthBorderLine = UILabel()
    let dateBorderLine = UILabel()
    let hourBorderLine = UILabel()
    let minuteBorderLine = UILabel()
    
    let timeInputView = UIStackView().then{
        $0.spacing = 36
        $0.axis = .horizontal
    }
    
    let dateStackView = UIStackView().then{
        $0.spacing = 13
        $0.axis = .horizontal
    }
    
    let monthView = UIView()
    let dateView = UIView()
    
    lazy var timeStackView = UIStackView().then{
        $0.spacing = 13
        $0.axis = .horizontal

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(timePickerWillAppear))
        $0.addGestureRecognizer(tapGesture)
        $0.isUserInteractionEnabled = true
    }
    
    let hourView = UIView()
    let minuteView = UIView()
    
    let locationTitle = UILabel().then{
        $0.text = "약속 장소"
    }
    
    let locationLabel = UILabel()
    
    let searchImage = UIImageView().then{
        $0.image = UIImage(named: "search_silver")
        $0.tintColor = .black10
    }
    
    let locationBorderLine = UIView().then{
        $0.backgroundColor = .black10
    }
    
    let locationInputView = UIView()
    
    let alaramTitle = UILabel().then{
        $0.text = "알림 설정"
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
        setUpViewProperties()
    }
    
    func setUpViewProperties(){
        
        [timeTitle, locationTitle, alaramTitle].forEach { each in
            each.font = UIFont.pretendard(size: 15, family: .Bold)
            each.textColor = .black85
        }
        
        [monthTitle, dateTitle, hourTitle, minuteTitle].forEach { each in
            each.font = UIFont.pretendard(size: 14, family: .Medium)
            each.textColor = .black
        }
        
        [monthLabel, dateLabel, hourLabel, minuteLabel].forEach { each in
            each.textColor = .zatchPurple
            each.font = UIFont.pretendard(size: 14, family: .Medium)
            each.textAlignment = .center
        }
        
        [monthBorderLine, dateBorderLine, hourBorderLine, minuteBorderLine].forEach{ each in
            each.backgroundColor = .black5
        }
    }
    
    @objc func timePickerWillAppear(){
        
        let picker = TimePickerAlertViewController()
        
        picker.pickerHandler = { array in
            self.hourLabel.text = String(array[0])
            self.minuteLabel.text = String(array[1])
        }
        
        picker.modalPresentationStyle = .overFullScreen
        picker.loadViewIfNeeded()
        self.present(picker, animated: false, completion: nil)
    }

}
