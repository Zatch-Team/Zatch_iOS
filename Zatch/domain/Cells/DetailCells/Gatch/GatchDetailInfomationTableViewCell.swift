//
//  GatchDetailInfomationTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/02.
//

import UIKit

class GatchDetailInfomationTableViewCell: BaseTableViewCell, BaseCellProtocol {
    
    //MARK: - Properties
    static let cellIdentifier: String = "GatchDetailInfomationTableViewCell"
    
    let titleStackView = UIStackView().then{
        $0.spacing = 12
        $0.axis = .horizontal
    }
    let productName = UILabel().then{
        $0.text = "재치 양념치킨"
        $0.setTypoStyleWithSingleLine(typoStyle: .bold20)
        $0.textColor = .black85
    }
    let purchaseTag = UILabel().then{
        $0.backgroundColor = .zatchDeepYellow
        $0.layer.cornerRadius = 28/2
        $0.textColor = .white
        $0.setTypoStyleWithSingleLine(typoStyle: .medium15_19)
        $0.font = UIFont.pretendard(size: 15, family:.Medium)
        $0.text = "구매후"
    }
    
    let titleUnderDetailStackView = UIStackView().then{
        $0.spacing = 8
        $0.axis = .horizontal
    }
    let profileAndWithMemberStackView = UIView()
    let borderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    let productInfoStackView = UIStackView().then{
        $0.spacing = 12
        $0.axis = .vertical
    }
    let productPersonnelStackView = UIStackView().then{
        $0.spacing = 24
        $0.axis = .horizontal
    }
    let productPriceStackView = UIStackView().then{
        $0.spacing = 24
        $0.axis = .horizontal
    }
    let handleRemainPersonnelView = UILabel().then{
        $0.backgroundColor = .black5
    }
    let productExplainView = UILabel()
    
    override func hierarchy() {
        super.hierarchy()
    }
    
    override func layout() {
        super.layout()
    }
}
