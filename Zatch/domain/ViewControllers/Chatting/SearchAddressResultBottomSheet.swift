//
//  SearchAddressResultBottomSheet.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/06.
//

import UIKit

class SearchAddressResultBottomSheet: SheetViewController {
    
    let mainView = SearchAddressResultView()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        sheetType = .MakeMeeting
        titleLabel.text = "주소검색"
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
    }

}
