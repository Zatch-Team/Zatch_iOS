//
//  SearchAddressBottomSheet.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/06.
//

import UIKit

class SearchAddressBottomSheet: SheetViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()

        sheetType = .MakeMeeting
        titleLabel.text = "주소검색"
        
        let searchView = SearchAddressView()
        
        self.view.addSubview(searchView)
        
        searchView.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-36)
        }
    }
}
