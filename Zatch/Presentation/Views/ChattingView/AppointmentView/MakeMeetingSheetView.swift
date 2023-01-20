//
//  MakeMeetingSheetView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/07.
//

import UIKit

class MakeMeetingSheetView: MeetingSheetView {
    
    let timeTotalInputView = UIStackView().then{
        $0.spacing = 36
        $0.axis = .horizontal
    }
    
    let dateStackView = UIStackView().then{
        $0.spacing = 13
        $0.axis = .horizontal
    }
    
    let timeStackView = UIStackView().then{
        $0.spacing = 13
        $0.axis = .horizontal
        $0.isUserInteractionEnabled = true
    }
    
    let monthView = TimeSettingView(timeText: "월")
    let dateView = TimeSettingView(timeText: "일")
    let hourView = TimeSettingView(timeText: "시")
    let minuteView = TimeSettingView(timeText: "분")
    
    let locationTotalView = UIView()
    
    let locationLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .zatchPurple
        $0.isUserInteractionEnabled = true
    }
    
    let searchImage = UIImageView().then{
        $0.image = Image.search
        $0.setImageTintColor(.black10)
    }
    
    let locationBorderLine = UIView().then{
        $0.backgroundColor = .black10
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.registerBtn.setTitle("약속잡기", for: .normal)
        
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
        
        locationInputView.addSubview(locationTotalView)
        
        locationTotalView.addSubview(locationLabel)
        locationTotalView.addSubview(locationBorderLine)
        locationTotalView.addSubview(searchImage)
    }
    
    override func setUpConstraint(){
        
        super.setUpConstraint()
        
        timeTotalInputView.snp.makeConstraints{
            $0.top.leading.equalToSuperview().offset(4)
        }
        
        locationTotalView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        locationLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().offset(-60)
            make.bottom.equalToSuperview().offset(-11)
        }
        
        locationBorderLine.snp.makeConstraints{ make in
            make.leading.equalTo(locationLabel)
            make.trailing.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview().offset(-8)
            make.height.equalTo(1.2)
        }
        
        searchImage.snp.makeConstraints{ make in
            make.width.height.equalTo(20)
            make.trailing.equalToSuperview().offset(-32)
            make.top.equalToSuperview().offset(4)
        }
    }
    
}

extension MakeMeetingSheetView{
    
    class TimeSettingView: UIView{
        
        let timeLabel = UILabel().then{
            $0.font = UIFont.pretendard(size: 14, family: .Medium)
            $0.textColor = .zatchPurple
            $0.textAlignment = .center
        }
        
        let timeTitle = UILabel().then{
            $0.font = UIFont.pretendard(size: 14, family: .Medium)
            $0.textColor = .black
            $0.textAlignment = .center
        }
        
        let timeBorderLine = UIView().then{
            $0.backgroundColor = .black5
        }
        
        init(timeText: String){
            
            self.timeTitle.text = timeText
            
            super.init(frame: .zero)
            
            setUpView()
            setUpConstraint()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setUpView(){
            self.addSubview(timeTitle)
            self.addSubview(timeLabel)
            self.addSubview(timeBorderLine)
        }
        
        func setUpConstraint(){
            
            self.snp.makeConstraints{
                $0.width.equalTo(45)
                $0.height.equalTo(24)
            }
            
            timeLabel.snp.makeConstraints{
                $0.leading.top.bottom.equalToSuperview()
                $0.width.equalTo(28)
            }
            
            timeTitle.snp.makeConstraints{
                $0.leading.equalTo(timeLabel.snp.trailing).offset(4)
                $0.top.bottom.trailing.equalToSuperview()
            }
            
            timeBorderLine.snp.makeConstraints{
                $0.height.equalTo(1.2)
                $0.bottom.equalToSuperview()
                $0.leading.trailing.equalTo(timeLabel)
            }
        }
    }
}
