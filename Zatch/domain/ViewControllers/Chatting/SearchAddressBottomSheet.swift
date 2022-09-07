//
//  SearchAddressBottomSheet.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/06.
//

import UIKit

class SearchAddressBottomSheet: SheetViewController {
    
    let mainView = SearchAddressView()

    override func viewDidLoad() {
        
        super.viewDidLoad()

        setInitSetting()
    }
    
    func setInitSetting(){
        
        sheetType = .MakeMeeting
        titleLabel.text = "주소검색"
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-36)
        }
    }
}
