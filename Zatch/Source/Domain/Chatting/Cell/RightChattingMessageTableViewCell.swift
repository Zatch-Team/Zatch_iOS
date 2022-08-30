//
//  ChattingRightTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/29.
//

import UIKit

class RightChattingMessageTableViewCell: BaseTableViewCell {
    
    //MARK: - Properties
    
    static let cellIdentifier = "rightMessageCell"
    
    //MARK: - UI
    
    let messageLabel = PaddingLabel(padding: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)).then{
        $0.layer.cornerRadius = 14
        $0.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMinYCorner)
        $0.backgroundColor = .zatchPurple
        $0.clipsToBounds = true
        $0.textColor = .white
        $0.font = UIFont.pretendard(size: 14, family: .Regular)
        $0.numberOfLines = 0
        
        $0.text = "가나다라마ㅏ바라ㅏ아사ㅏ가나다라마ㅏ바라ㅏ아사ㅏ가나다라마ㅏ바라ㅏ아사ㅏ가나다라마ㅏ바라ㅏ아"
    }
    let timeLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 12, family: .Regular)
        $0.textColor = .black85
        
        $0.text = "13:42"
    }
    
    let backView = UIView()
    
    //MARK: - LifeCycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper
    
    private func setUpView(){
        self.contentView.addSubview(backView)
        
        backView.addSubview(timeLabel)
        backView.addSubview(messageLabel)
    }
    
    private func setUpConstraint(){
        
        self.contentView.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        self.backView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.leading.trailing.equalToSuperview()
        }
        
        self.timeLabel.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.trailing.equalTo(messageLabel.snp.leading).offset(-4)
        }
        
        self.messageLabel.snp.makeConstraints{ make in
            make.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview()
            
            let maxWidth = 240 / 360 * Const.deviceWidth
            make.width.lessThanOrEqualTo(maxWidth)
        }
    }
}
