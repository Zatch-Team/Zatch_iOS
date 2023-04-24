//
//  RegisterCategorySelectView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/10.
//

import Foundation

class RegisterCategorySelectView: BaseView{
    
    private let boundaryLine = UIView().then{
        $0.backgroundColor = .black5
    }
    let categoryText = UILabel().then{
        $0.text = "카테고리 선택"
        $0.setTypoStyleWithSingleLine(typoStyle: .medium14)
    }
    lazy var arrowImage = UIButton().then{
        $0.setImage(Image.arrowDown, for: .normal)
        $0.setImage(Image.arrowUp, for: .selected)
    }
  
    override func hierarchy() {
        super.hierarchy()
        addSubview(boundaryLine)
        addSubview(categoryText)
        addSubview(arrowImage)
    }
    
    override func layout() {
        
        super.layout()
        
        self.snp.makeConstraints{ make in
            make.height.equalTo(41)
        }
        
        boundaryLine.snp.makeConstraints{ make in
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        categoryText.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(36)
        }
        arrowImage.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalToSuperview().offset(12)
        }
    }
}
