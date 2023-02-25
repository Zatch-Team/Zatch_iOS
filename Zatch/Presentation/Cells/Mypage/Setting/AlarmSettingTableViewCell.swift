//
//  AlarmSettingTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/19.
//

import UIKit

class AlarmSettingTableViewCell: BaseTableViewCell {
    
    enum AlarmSettingType{
        case chatting
        case gatch
    }

    var delegate: AlarmSwitchDelegate!
    private var alarmType: AlarmSettingType!
    
    //MARK: - UI
    
    private let titleLabel = UILabel().then{
        $0.textColor = .black85
        $0.setTypoStyleWithSingleLine(typoStyle: .medium15_21)
    }
    
    private let explainLabel = UILabel().then{
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.textColor = .black85
        $0.setTypoStyleWithMultiLine(typoStyle: .regular12)
        
    }
    
    private let alarmSwitch = UISwitch().then{
        $0.onTintColor = .zatchYellow
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hierarchy() {
        
        super.hierarchy()
        
        baseView.addSubview(titleLabel)
        baseView.addSubview(explainLabel)
        baseView.addSubview(alarmSwitch)
    }
    
    override func layout() {
        
        super.layout()
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(20)
        }
        
        explainLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-90)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        alarmSwitch.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10.5)
            $0.leading.equalTo(explainLabel.snp.trailing).offset(21)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func initialize() {
        alarmSwitch.addTarget(self, action: #selector(willSwitchValueChange), for: .valueChanged)
    }
    
    @objc private func willSwitchValueChange(){
        switch alarmType{
        case .chatting:
            delegate.willChangeChattingAlarmState(alarmSwitch.isOn); break
        case .gatch:
            delegate.willChangeGatchAlarmState(alarmSwitch.isOn); break
        default:
            break
        }
    }
    
    func setCaseAndSwitchValue(_ type: AlarmSettingType, isOn: Bool){
        alarmType = type
        titleLabel.text = type.title
        explainLabel.text = type.explain
        alarmSwitch.isOn = isOn
    }
}

extension AlarmSettingTableViewCell.AlarmSettingType{
    var title: String{
        switch self{
        case .chatting:     return "채팅 알림"
        case .gatch:        return "가치 알림"
        }
    }
    
    var explain: String{
        switch self{
        case .chatting:     return "누군가 나에게 채팅을 보낼 경우에 알림을 받습니다."
        case .gatch:        return "내가 올린 가치에 참여자가 생기거나, 내가 참여한 가치의 참여자가 모두 모였을 경우에 알림을 받습니다."
        }
    }
}
