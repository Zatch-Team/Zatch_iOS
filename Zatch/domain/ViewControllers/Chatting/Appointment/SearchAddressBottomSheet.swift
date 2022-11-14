//
//  SearchAddressBottomSheet.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/06.
//

import UIKit
import RxSwift
import RxCocoa

class SearchAddressSheetViewController: SheetViewController {
    
    let mainView = SearchAddressView()
    let viewModel = SearchAddressViewModel()

    override func viewDidLoad() {
        
        super.viewDidLoad()

        setInitSetting()
        bind()
    }
    
    func setInitSetting(){
        
        //sheetVC 기본 UI 설정
        bottomSheetType = .MakeMeeting
        titleLabel.text = "주소검색"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(willMoveMapViewController))
        mainView.myLocationFrame.addGestureRecognizer(tapGesture)
        
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
    
    @objc func willMoveMapViewController(){
        let vc = MapMeetingViewController()
        vc.navigation = self.navigationController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

extension SearchAddressSheetViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let searchLocation = textField.text ?? ""
        
        if(!searchLocation.isEmpty){
            moveSearchAddressResultSheet(searchLocation) }
        
        return true
    }
    
    func moveSearchAddressResultSheet(_ location: String){
        let vc = SearchAddressResultSheetViewController()
        vc.requestSearchResult(query: location)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
