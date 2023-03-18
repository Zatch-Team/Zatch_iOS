//
//  BaseBottomSheetTableViewCell.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/18.
//

import Foundation

class BaseBottomSheetTableViewCell: BaseTableViewCell{
    
    private let titleLabel = UILabel().then{
        $0.setTypoStyleWithSingleLine(typoStyle: .medium18)
        $0.textColor = .black85
    }
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(titleLabel)
    }
    
    override func layout() {
        super.layout()
        baseView.snp.makeConstraints{
            $0.height.equalTo(50)
        }
        titleLabel.snp.makeConstraints{
            $0.top.centerX.equalToSuperview()
        }
    }
    
    func setTitle(_ title: String){
        titleLabel.text = title
    }
    
    func setSelectState(){
        titleLabel.textColor = .zatchYellow
    }
}
