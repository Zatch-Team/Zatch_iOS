//
//  DetailEtcBottomSheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/04.
//

import UIKit

class DetailEtcBottomSheetViewController: BaseBottomSheetViewController {
    
    let mainView = DetailEtcBottomSheetView()

    init(){
        super.init(type: .detailEtc)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        self.view.addSubview(mainView)
        mainView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
}
