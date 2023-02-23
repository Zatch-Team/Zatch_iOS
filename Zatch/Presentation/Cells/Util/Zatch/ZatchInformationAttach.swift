//
//  ZatchInformationAttach.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/14.
//

import Foundation

protocol ZatchInformationAttach{
    var zatchStackView: UIStackView { get }
    var myZatchNameLabel: UILabel { get }
    func zatchStackViewHierarchy()
    func zatchStackViewLayout()
}

extension ZatchInformationAttach where Self: ZatchTableViewCell{
    func zatchStackViewLayout(){
        zatchStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalTo(zatchImage.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(55)
        }
    }
}
