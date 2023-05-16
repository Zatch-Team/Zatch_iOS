//
//  MoreTextTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/27.
//

import UIKit

final class MoreTextTableViewCell: BaseTableViewCell, BindingZatch {
    
    private let moreText = UILabel().then{
        $0.numberOfLines = 0
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 14, family: .Regular)
    }
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(moreText)
    }
    
    override func layout() {
        super.layout()
        moreText.snp.makeConstraints{
            $0.leading.trailing.top.bottom.equalToSuperview().inset(24)
        }
    }
    
    func bindingData(_ zatch: ZatchResponseModel){
        moreText.text = zatch.content
    }

}
