//
//  ProfileZatchTitleTableViewCell.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/23.
//

import Foundation

class TitleAndMoreButtonTableViewCell: BaseTableViewCell{
    
    private let titleLabel = UILabel().then{
        $0.setTypoStyleWithSingleLine(typoStyle: .bold17)
    }
    private let moreButton = UIButton().then{
        var config = UIButton.Configuration.plain()
        var attText = AttributedString.init("더보기")
        
        attText.font = UIFont.pretendard(size: 14, family: .Medium)
        attText.foregroundColor = UIColor.black20
        config.attributedTitle = attText
        
        $0.configuration = config
    }
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(titleLabel)
        baseView.addSubview(moreButton)
    }
    
    override func layout() {
        super.layout()
        titleLabel.snp.makeConstraints{
            $0.leading.top.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().inset(4)
        }
        moreButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(22)
            $0.bottom.equalToSuperview().inset(5)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
    
    func setTitle(_ title: String){
        titleLabel.text = title
    }
}
