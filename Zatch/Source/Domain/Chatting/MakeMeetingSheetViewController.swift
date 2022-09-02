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
        $0.font = UIFont.pretendard(size: 15, family: .Bold)
        $0.textColor = .black85
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
    
    @objc func timePickerWillAppear(){
        let picker = TimePickerAlertViewController(message: nil)
        picker.timePickerHandler = { array in
            self.hourLabel.text = String(array[0])
            self.minuteLabel.text = String(array[1])
        }
        
        picker.modalPresentationStyle = .overFullScreen
        picker.loadViewIfNeeded()
        self.present(picker, animated: false, completion: nil)
    }

}
