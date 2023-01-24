//
//  SearchAddressSheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/06.
//

import UIKit
import RxSwift
import RxCocoa

class SearchAddressSheetViewController: BaseBottomSheetViewController<Void> {
    
    let mainView = SearchAddressView()
    let viewModel = SearchAddressViewModel()

    init(){
        super.init(type: .makeMeeting)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize() {
        
        super.initialize()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(willMoveMapViewController))
        mainView.myLocationFrame.addGestureRecognizer(tapGesture)
        
        mainView.searchTextField.delegate = self
    }
    
    override func layout() {
        
        super.layout()
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-36)
        }
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
