//
//  TownSettingTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/12.
//

import UIKit

class TownSettingTableViewCell: BaseTableViewCell {
    
    var delegate: MyPageCellDelegate?
    
    private let titleLabel = UILabel().then{
        $0.text = "내 동네 관리"
        $0.setTypoStyleWithSingleLine(typoStyle: .bold15)
    }
    private let townStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 8
    }
    private let settingIcon = UIImageView().then{
        $0.image = Image.pin
    }
    private let setTownLabel = UILabel().then{
        $0.text = "내 동네 설정"
        $0.setTypoStyleWithSingleLine(typoStyle: .regular15)
    }
    private let borderLine = ZatchComponent.SectionDivider()

    // MARK: - LifeCycles
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize(){
        townStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(townStackViewDidTappeed)))
    }

    override func hierarchy() {
        
        super.hierarchy()

        baseView.addSubview(titleLabel)
        baseView.addSubview(townStackView)
        baseView.addSubview(borderLine)
        
        townStackView.addArrangedSubview(settingIcon)
        townStackView.addArrangedSubview(setTownLabel)
    }
    
    override func layout() {
        
        super.layout()
        
        titleLabel.snp.makeConstraints{
            $0.leading.top.equalToSuperview().offset(20)
        }
        townStackView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(22)
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().inset(18 + 8)
        }
        settingIcon.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        borderLine.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(8)
        }
    }
    
    @objc private func townStackViewDidTappeed(){
        delegate?.willMoveTownSettingViewController()
    }
}
