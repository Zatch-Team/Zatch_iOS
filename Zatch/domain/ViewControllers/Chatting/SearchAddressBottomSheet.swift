//
//  SearchAddressBottomSheet.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/06.
//

import UIKit
import RxSwift
import RxCocoa

class SearchAddressBottomSheet: SheetViewController {
    
    let mainView = SearchAddressView()
    let viewModel = SearchAddressViewModel()

    override func viewDidLoad() {
        
        super.viewDidLoad()

        setInitSetting()
        bind()
    }
    
    func setInitSetting(){
        
        //sheetVC 기본 UI 설정
        sheetType = .MakeMeeting
        titleLabel.text = "주소검색"
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-36)
        }
        
        mainView.searchTextField.delegate = self
    }
    
    func bind(){
     /*
        self.mainView.searchTextField.rx.controlEvent(.editingDidEndOnExit)
            .asObservable()
            .subscribe{ text in
                print(text)
            }
//            .disposed(by: bag)
      */
    }
}

extension SearchAddressBottomSheet: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let searchLocation = textField.text ?? ""
        
        if(!searchLocation.isEmpty){
            moveSearchAddressResultSheet(searchLocation) }
        
        return true
    }
    
    func moveSearchAddressResultSheet(_ location: String){
        let vc = SearchAddressResultBottomSheet()
        vc.mainView.searchTextField.text = location
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
