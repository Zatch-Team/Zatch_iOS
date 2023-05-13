//
//  ZatchShareTableViewCell.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/14.
//

import Foundation

final class ZatchShareTableViewCell: ZatchTableViewCell, ZatchInformationAttach{
    
    let zatchStackView = UIStackView().then{
        $0.spacing = 4
        $0.axis = .vertical
        $0.alignment = .leading
    }
    let shareTag = ZatchComponent.Tag.filled(color: .yellow, configuration: .height25).then{
        $0.setTitle("나눔")
    }
    let myZatchNameLabel = UILabel().then{
        $0.text = "삼다수 생수 1L"
        $0.font = UIFont.pretendard(size: 17, family: .Bold)
    }
    
    func zatchStackViewHierarchy() {
        baseView.addSubview(zatchStackView)
        
        zatchStackView.addArrangedSubview(shareTag)
        zatchStackView.addArrangedSubview(myZatchNameLabel)
    }
    
    override func hierarchy() {
        super.hierarchy()
        zatchStackViewHierarchy()
    }
    
    override func layout() {
        super.layout()
        zatchStackViewLayout()
    }
    
}
