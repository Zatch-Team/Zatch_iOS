//
//  ChattingListTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/16.
//

import UIKit

class ChattingListTableViewCell: BaseTableViewCell {
    
    static let cellIdentifier = "chattingListCell"
    
    let nameLabel = UILabel().then{
        $0.text = "쑤야"
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
    }
    
    let profileImage = UIImageView().then{
        $0.image = UIImage(named: "zatch_profile")
    }
    
    let recentMessageLabel = UILabel().then{
        $0.text = "문의드립니다."
        $0.textColor = .black85
        $0.numberOfLines = 1
        $0.font = UIFont.pretendard(size: 12, family: .Regular)
    }
    
    let timeLabel = UILabel().then{
        $0.textAlignment = .center
        $0.text = "오후 7:13"
        $0.textColor = UIColor(red: 166/255, green: 166/255, blue: 166/255, alpha: 1)
        $0.font = UIFont.pretendard(size: 10, family: .Regular)
    }
    
    let borderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    let infoStackView = UIStackView().then{
        $0.axis = .vertical
        $0.spacing = 7
    }
    
    let backView = UIView()
    
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
        
        self.infoStackView.addArrangedSubview(nameLabel)
        self.infoStackView.addArrangedSubview(recentMessageLabel)
        
        self.backView.addSubview(profileImage)
        self.backView.addSubview(infoStackView)
        self.backView.addSubview(timeLabel)
        self.backView.addSubview(borderLine)
    }
    
    func setUpConstraint(){
        
        backView.snp.makeConstraints{ make in
            make.leading.trailing.top.bottom.equalToSuperview()
            make.height.equalTo(80)
        }
        
        profileImage.snp.makeConstraints{ make in
            make.width.height.equalTo(68)
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        infoStackView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(18)
            make.bottom.equalToSuperview().offset(-22)
            make.leading.equalTo(profileImage.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-80)
        }

        timeLabel.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalToSuperview().offset(16)
            make.height.equalTo(20)
        }
        
        borderLine.snp.makeConstraints{ make in
            make.height.equalTo(1)
            make.bottom.equalToSuperview().offset(-1)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        
    }
    

}
