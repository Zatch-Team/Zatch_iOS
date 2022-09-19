//
//  AlarmSettingTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/19.
//

import UIKit

class AlarmSettingTableViewCell: BaseTableViewCell {

    static let cellIdentifier = "AlarmSettingTableViewCell"
    
    let titleLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 15, family: .Medium)
        $0.textColor = .black85
    }
    
    let explainLabel = UILabel().then{
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.font = UIFont.pretendard(size: 12, family: .Regular)
        $0.textColor = .black85
        $0.setTextWithLineHeight(lineHeight: 15.6)
        
    }
    
    let alarmSwitch = UISwitch()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.baseView.addSubview(titleLabel)
        self.baseView.addSubview(explainLabel)
        self.baseView.addSubview(alarmSwitch)
        
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
