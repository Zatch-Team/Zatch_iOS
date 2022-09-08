//
//  ModifyMeetingSheetView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/07.
//

import UIKit

class ModifyMeetingSheetView: MeetingSheetView {
    
    let timeTotalInputView = UIStackView().then{
        $0.spacing = 16
        $0.axis = .horizontal
    }
    let dateStackView = UIStackView().then{
        $0.spacing = 4
        $0.axis = .horizontal
    }
    let timeStackView = UIStackView().then{
        $0.spacing = 4
        $0.axis = .horizontal
    }
    
    let monthView = MeetingTimeInfoView(title: "월")
    let dateView = MeetingTimeInfoView(title: "일")
    let hourView = MeetingTimeInfoView(title: "시")
    let minuteView = MeetingTimeInfoView(title: "분")
    
    let locationLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black
        $0.text = "서대문구 홍제동"
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.makeMeetingBtn.setTitle("수정하기", for: .normal)
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUpView(){
        
        super.setUpView()
        
        timeInputView.addSubview(timeTotalInputView)
        
        timeTotalInputView.addArrangedSubview(dateStackView)
        timeTotalInputView.addArrangedSubview(timeStackView)
        
        dateStackView.addArrangedSubview(monthView)
        dateStackView.addArrangedSubview(dateView)
        
        timeStackView.addArrangedSubview(hourView)
        timeStackView.addArrangedSubview(minuteView)
        
        locationInputView.addSubview(locationLabel)
    }
    
    override func setUpConstraint(){
        
        super.setUpConstraint()
        
        timeTotalInputView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview()
        }
        
        locationLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview()
        }
    }
}

extension ModifyMeetingSheetView{
    
    class MeetingTimeInfoView: UIView{
        
        let stackView = UIStackView().then{
            $0.spacing = 2
            $0.axis = .horizontal
        }
        
        let timeLabel = UILabel().then{
            $0.font = UIFont.pretendard(size: 14, family: .Medium)
            $0.textColor = .black
            $0.text = "13"
        }
        
        let timeTitle = UILabel().then{
            $0.font = UIFont.pretendard(size: 14, family: .Medium)
            $0.textColor = .black
        }
        
        init(title: String) {
            super.init(frame: .zero)
            timeTitle.text = title
            
            self.setUpView()
            self.setUpConstraint()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setUpView(){
            self.addSubview(stackView)
            stackView.addArrangedSubview(timeLabel)
            stackView.addArrangedSubview(timeTitle)
        }
        
        func setUpConstraint(){
            stackView.snp.makeConstraints{
                $0.leading.trailing.top.bottom.equalToSuperview()
            }
        }
    }
    
}
