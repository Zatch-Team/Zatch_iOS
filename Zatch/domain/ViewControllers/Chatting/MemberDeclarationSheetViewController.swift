//
//  MemberDeclarationSheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/28.
//

import UIKit

class MemberDeclarationSheetViewController: BaseBottomSheetViewController {
    
    let blockBtn = UILabel().then{
        $0.text = "차단하기"
        $0.font = UIFont.pretendard(size: 16, family: .Medium)
        $0.textColor = .black85
        $0.textAlignment = .center
        $0.isUserInteractionEnabled = true
    }
    
    let declarationBtn = UILabel().then{
        $0.text = "신고하기"
        $0.font = UIFont.pretendard(size: 16, family: .Medium)
        $0.textColor = .black85
        $0.textAlignment = .center
        $0.isUserInteractionEnabled = true
    }
    

    init(){
        super.init(type: .declaration)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layout() {
        
        self.view.addSubview(blockBtn)
        self.view.addSubview(declarationBtn)
        
        blockBtn.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
        }
        
        declarationBtn.snp.makeConstraints{ make in
            make.top.equalTo(blockBtn.snp.bottom).offset(28)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-36)
        }
    }
    
}
