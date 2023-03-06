//
//  MyInfoTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/12.
//

import UIKit

class MyInfoTableViewCell: BaseTableViewCell {
    
    var delegate: MyPageCellDelegate?
    
    private let userImage = UIImageView().then{
        $0.backgroundColor = .black10
        $0.layer.cornerRadius = 116/2
    }
    private let userName = UILabel().then{
        $0.text = "userName"
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }
    private lazy var goProfileButton = WhitePurpleButton().then{
        $0.setTitle("프로필 보기", for: .normal)
    }
    private let sectionDivider = ZatchComponent.SectionDivider().then{
        $0.isHidden = true
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

        baseView.addSubview(userImage)
        baseView.addSubview(userName)
        baseView.addSubview(goProfileButton)
        baseView.addSubview(sectionDivider)
    }
    
    override func layout() {
        
        super.layout()
        
        userImage.snp.makeConstraints {
            $0.width.height.equalTo(116)
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
        }
        userName.snp.makeConstraints {
            $0.top.equalTo(userImage.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        goProfileButton.snp.makeConstraints {
            $0.top.equalTo(userName.snp.bottom).offset(20)
            $0.width.equalTo(170)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(36)
        }
        sectionDivider.snp.makeConstraints{
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private func initialize(){
        goProfileButton.addTarget(self, action: #selector(goProfileButtonDidTapped), for: .touchUpInside)
    }
    
    @objc private func goProfileButtonDidTapped(){
        delegate?.willMoveProfileViewController()
    }
    
    func willSectionDividerShow(){
        sectionDivider.isHidden = false
        goProfileButton.snp.updateConstraints{
            $0.bottom.equalToSuperview().inset(20 + 8)
        }
    }
    
    func bindingData(_ profile: Any){
        
    }
    
    func showProfileImageBorderLine(){
        userImage.layer.borderColor = UIColor.zatchPurple.cgColor
        userImage.layer.borderWidth = 6
    }
}
