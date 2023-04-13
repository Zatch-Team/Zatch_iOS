//
//  BlockUserTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/15.
//

import UIKit

class BlockUserTableViewCell: BaseTableViewCell {
    
    var delegate: BlockUserDelegate?
    
    let userInfoStackView = UIStackView().then{
        $0.spacing = 8
        $0.axis = .horizontal
        $0.alignment = .leading
    }
    
    let userImageView = UIImageView().then{
        $0.backgroundColor = .black20
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 40/2
    }
    
    let userNameLabel = UILabel().then{
        $0.text = "어리둥절 너구리"
        $0.setTypoStyleWithSingleLine(typoStyle: .medium16)
        $0.textColor = .black85
    }
    
    lazy var unblockBtn = UIButton().then{
        $0.setImage(Image.exit, for: .normal)
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
        
        baseView.addSubview(userInfoStackView)
        baseView.addSubview(unblockBtn)
        
        userInfoStackView.addArrangedSubview(userImageView)
        userInfoStackView.addArrangedSubview(userNameLabel)
    }
    
    override func layout() {
        
        super.layout()
        
        userInfoStackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(5.5)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
  
        userImageView.snp.makeConstraints{
            $0.top.bottom.leading.equalToSuperview()
            $0.width.height.equalTo(40)
        }
        
        userNameLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
        }
        
        unblockBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalToSuperview().offset(13.5)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(unblockBtn.snp.height)
        }
    }
    
    override func initialize(){
        unblockBtn.addTarget(self, action: #selector(unblockBtnDidClicked), for: .touchUpInside)
    }
    
    @objc private func unblockBtnDidClicked(){
        delegate?.willBlockUser()
    }
    
    func bindingData(){
        
    }
}
