//
//  ChattingMemberTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/21.
//

import UIKit

class ChattingMemberTableViewCell: BaseTableViewCell {
    
    static let cellIdentifier = "chattingMemberCell"
    
    let backView = UIView()
    
    let profileImage = UIImageView().then{
        $0.image = UIImage(named: "zatch_profile")
    }
    
//    let leaderIcon = UIImageView().then{
//
//    }
    
    let nameLabel = UILabel().then{
        $0.text = "쑤야"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black85
    }
    
//    let declarationBtn = UIButton().then{
//
//    }
    
    let selfTag = UILabel().then{
        $0.text = "ME"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    func setByCase(){
        
    }

}
