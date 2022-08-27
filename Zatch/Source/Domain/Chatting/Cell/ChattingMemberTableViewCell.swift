//
//  ChattingMemberTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/21.
//

import UIKit

class ChattingMemberTableViewCell: BaseTableViewCell {
    
    //MARK: - Properties
    
    static let cellIdentifier = "chattingMemberCell"
    
    //MARK: - UI
    
    let backView = UIView()
    
    let profileImage = UIImageView().then{
        $0.image = UIImage(named: "zatch_profile")
    }
    
    let managerCrownImage = UIImageView().then{
        $0.image = UIImage(named: "crown")
    }
    
    let isMeTag = UILabel().then{
        $0.text = "ME"
        $0.textAlignment = .center
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.layer.cornerRadius = 20/2
        $0.clipsToBounds = true
        $0.layer.borderColor = UIColor.zatchPurple.cgColor
        $0.layer.borderWidth  = 1.5
        $0.backgroundColor = .white
        $0.textColor = .zatchPurple
    }
    
    let nameLabel = UILabel().then{
        $0.text = "쑤야"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black85
    }
    
    lazy var declarationBtn = UIButton().then{
        $0.setImage(UIImage(named: "declaration"), for: .normal)
    }
    
    //MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse(){
        
        self.declarationBtn.removeFromSuperview()
        self.isMeTag.removeFromSuperview()
        
        self.nameLabel.text = ""
    }
    
    //MARK: - Helper
    
    func setUpView(){
        self.contentView.addSubview(backView)
        
        self.backView.addSubview(profileImage)
        self.backView.addSubview(nameLabel)
    }
    
    func setUpConstraint(){
        
        backView.snp.makeConstraints{ make in
            make.top.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(52)
        }
        
        profileImage.snp.makeConstraints{ make in
            make.width.height.equalTo(44)
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(profileImage.snp.trailing).offset(4)
            make.trailing.equalToSuperview().offset(-75)
        }
    }
    
    func setMeTag(){
        
        self.backView.addSubview(isMeTag)
        
        isMeTag.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            make.height.equalTo(20)
            
            let label = UILabel().then{
                $0.text = "ME"
                $0.font = UIFont.pretendard(size: 12, family: .Medium)
            }
            let width = label.intrinsicContentSize.width
            make.width.equalTo(width + 30)
        }
        
    }
    
    func setDeclarationBtn(){
        
        self.backView.addSubview(declarationBtn)
        
        declarationBtn.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-20)
            make.width.trailing.equalTo(24)
            make.centerY.equalToSuperview()
        }
    }
    
    func setCrownImage(){
        
        self.backView.addSubview(managerCrownImage)
        
        managerCrownImage.snp.makeConstraints{ make in
            make.width.height.equalTo(12.94)
            make.bottom.equalTo(profileImage.snp.bottom).offset(-3.88)
            make.trailing.equalTo(profileImage).offset(-6.47)
        }
    }

}
