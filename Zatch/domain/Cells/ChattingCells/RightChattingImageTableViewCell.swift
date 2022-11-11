//
//  RightChattingImageTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/30.
//

import UIKit

class RightChattingImageTableViewCell: BaseTableViewCell {
    //MARK: - Properties
    
    static let cellIdentifier = "rightImageCell"
    
    //MARK: - UI
    
    let imageMessageView = UIImageView().then{
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    let timeLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 12, family: .Regular)
        $0.textColor = .black85
        
        $0.text = "13:42"
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
    
    //MARK: - Helper
    
    private func setUpView(){
        baseView.addSubview(timeLabel)
        baseView.addSubview(imageMessageView)
    }
    
    private func setUpConstraint(){
        
        self.contentView.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        baseView.snp.updateConstraints{ make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        self.timeLabel.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.trailing.equalTo(imageMessageView.snp.leading).offset(-4)
        }
        
        self.imageMessageView.snp.makeConstraints{ make in
            make.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.height.lessThanOrEqualTo(200 / 360 * Const.Device.DEVICE_WIDTH)
        }
    }
}
