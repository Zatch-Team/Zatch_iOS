//
//  BlockUserTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/15.
//

import UIKit

class BlockUserTableViewCell: BaseTableViewCell {
    
    static let cellIdentifier = "BlockUserTableViewCell"
    
    let userInfoStackView = UIStackView().then{
        $0.spacing = 8
        $0.axis = .horizontal
        $0.alignment = .leading
    }
    
    let userImageView = UIImageView().then{
        $0.backgroundColor = .black20
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 32/2
    }
    
    let userNameLabel = UILabel().then{
        $0.text = "어리둥절 너구리"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black85
    }
    
    lazy var unblockBtn = UIButton().then{
        $0.setImage(Image.exit, for: .normal)
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
        
        self.baseView.addSubview(userInfoStackView)
        self.baseView.addSubview(unblockBtn)
        
        userInfoStackView.addArrangedSubview(userImageView)
        userInfoStackView.addArrangedSubview(userNameLabel)
        
    }
    
    func setUpConstraint(){
        
        userInfoStackView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(24)
            $0.top.equalToSuperview().offset(10)
        }
        
        userImageView.snp.makeConstraints{
            $0.top.bottom.leading.equalToSuperview()
            $0.width.height.equalTo(32)
        }
        
        unblockBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-24)
            $0.top.equalToSuperview().offset(14)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(unblockBtn.snp.height)
        }
        
        userNameLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
        }
    
    }
    
    

}
