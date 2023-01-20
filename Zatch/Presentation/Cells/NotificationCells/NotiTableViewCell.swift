//
//  NotiTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/27.
//

import UIKit

class NotiTableViewCell: UITableViewCell {
    var notiTypeLabel = UILabel().then{
        $0.text = "notification Type"
        $0.font = UIFont.pretendard(size: 13, family: .Bold)
    }
    let notiTimeLabel = UILabel().then{
        $0.text = "2020.09.16"
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textColor = .black20
    }
    let notiContentLabel = UILabel().then{
        $0.text = "notification content..."
        $0.font = UIFont.pretendard(size: 13, family: .Medium)
        $0.numberOfLines = 0
    }

    // MARK: - LifeCycles
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Functions
    func setCellData(_ notiType: String) {
        notiTypeLabel.text = notiType
        var textColor: UIColor!
        switch notiType {
        case "재치":
            textColor = .zatchPurple
        case "가치":
            textColor = .zatchDeepYellow
        default:
            textColor = .black85
        }
        notiTypeLabel.textColor = textColor
    }
    func setUpView() {
        contentView.addSubview(notiTypeLabel)
        contentView.addSubview(notiTimeLabel)
        contentView.addSubview(notiContentLabel)
    }
    func setUpConstraint() {
        notiTypeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(12)
        }
        notiTimeLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
        }
        notiContentLabel.snp.makeConstraints { make in
            make.top.equalTo(notiTypeLabel.snp.bottom).offset(6)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(notiTimeLabel.snp.top).offset(-4)
        }
    }
}
