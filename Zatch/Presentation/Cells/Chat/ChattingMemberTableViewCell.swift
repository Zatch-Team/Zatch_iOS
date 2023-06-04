//
//  ChattingMemberTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/21.
//

import UIKit
import Kingfisher

protocol DeclarationDelegate: AnyObject{
    func willShowDelclarationBottomSheet(index: Int)
}

class ChattingMemberTableViewCell: BaseTableViewCell {
    
    //MARK: - UI
    
    weak var delegate: (DeclarationDelegate)?
    
    private let profileImage = UIImageView().then{
        $0.image = Image.zatchProfile
    }
    private let managerCrownImage = UIImageView().then{
        $0.image = Image.chatCrown
    }
    private let isMeTag = UILabel().then{
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
    private let nameLabel = UILabel().then{
        $0.setTypoStyleWithSingleLine(typoStyle: .medium16)
        $0.textColor = .black85
    }
    private lazy var declarationBtn = UIButton().then{
        $0.setImage(Image.chatDeclaration, for: .normal)
    }

    override func prepareForReuse(){
        declarationBtn.removeFromSuperview()
        isMeTag.removeFromSuperview()
        nameLabel.text = ""
    }
    
    //MARK: - Helper
    override func hierarchy(){
        super.hierarchy()
        baseView.addSubview(profileImage)
        baseView.addSubview(nameLabel)
    }

    override func layout(){
        
        super.layout()
        
        baseView.snp.makeConstraints{
            $0.height.equalTo(52)
        }
        profileImage.snp.makeConstraints{
            $0.width.height.equalTo(44)
            $0.leading.equalToSuperview().offset(24)
            $0.centerY.equalToSuperview()
        }
        nameLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(profileImage.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().offset(-85)
        }
    }
    
    override func initialize() {
        declarationBtn.addTarget(self, action: #selector(declarationBtnDidTap), for: .touchUpInside)
    }
    
    @objc private func declarationBtnDidTap(){
        if let indexPath = cellIndexPath{
            delegate?.willShowDelclarationBottomSheet(index: indexPath.row)
        }
    }
    
    private func setMeTag(){
    
        baseView.addSubview(isMeTag)
        
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
    
    private func setDeclarationBtn(){
        
        baseView.addSubview(declarationBtn)
        
        declarationBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-24)
            $0.width.trailing.equalTo(28)
            $0.centerY.equalToSuperview()
        }
    }
    
    private func setCrownImage(){
        
        baseView.addSubview(managerCrownImage)
        
        managerCrownImage.snp.makeConstraints{
            $0.width.height.equalTo(12.94)
            $0.bottom.equalTo(profileImage.snp.bottom).offset(-3.88)
            $0.trailing.equalTo(profileImage).offset(-6.47)
        }
    }
    
    func bindingData(_ member: ChattingMember){
        nameLabel.text = member.name
        profileImage.kf.setImage(with: URL(string: member.profileImageUrl), placeholder: Image.zatchProfile)
        if member.isMe {
            setMeTag()
        } else {
           setDeclarationBtn()
        }
    }

}
