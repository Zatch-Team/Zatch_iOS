//
//  DetailEtcBottomSheetView.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/04.
//

import UIKit

class DetailEtcBottomSheetView: BaseView {
    
    let buttonStackView = UIStackView().then{
        $0.spacing = 26
        $0.axis = .vertical
    }

    let editButton = UIButton().then{
        $0.setTitle("수정", for: .normal)
        $0.titleLabel?.setTypoStyleWithSingleLine(typoStyle: .medium18)
        $0.titleLabel?.textAlignment = .center
        $0.setTitleColor(.black85, for: .normal)
    }
    
    let deleteButton = UIButton().then{
        $0.setTitle("삭제", for: .normal)
        $0.titleLabel?.setTypoStyleWithSingleLine(typoStyle: .medium18)
        $0.titleLabel?.textAlignment = .center
        $0.setTitleColor(.black85, for: .normal)
    }
    
    override func hierarchy() {
        self.addSubview(buttonStackView)
        
        buttonStackView.addArrangedSubview(editButton)
        buttonStackView.addArrangedSubview(deleteButton)
    }
    
    override func layout() {
        buttonStackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(24)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-34)
        }
        editButton.snp.makeConstraints{
            $0.width.equalTo(editButton.intrinsicContentSize.width).offset(40)
            $0.height.equalTo(editButton.intrinsicContentSize.height)
        }
        deleteButton.snp.makeConstraints{
            $0.width.height.equalTo(editButton)
        }
    }

}
