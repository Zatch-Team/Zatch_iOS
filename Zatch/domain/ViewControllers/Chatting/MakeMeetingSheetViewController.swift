//
//  MakeMeetingSheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/31.
//

import UIKit
import RxCocoa
import RxSwift

class MakeMeetingSheetViewController: SheetViewController {
    
    let mainView = MakeMeetingSheetView().then{
        $0.registerBtn.addTarget(self, action: #selector(registerBtnDidClicked), for: .touchUpInside)
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        super.titleLabel.removeFromSuperview()
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-23)
        }
        
        let locationTap = UITapGestureRecognizer(target: self, action: #selector(willLocationSearchSheetOpen))
        mainView.locationLabel.addGestureRecognizer(locationTap)

        let timeTap = UITapGestureRecognizer(target: self, action: #selector(timePickerWillAppear))
        mainView.timeStackView.addGestureRecognizer(timeTap)
    }
    
    @objc func timePickerWillAppear(){
        
        let picker = TimePickerAlertViewController()
        
        picker.pickerHandler = { array in
            self.mainView.hourView.timeLabel.text = String(array[0])
            self.mainView.minuteView.timeLabel.text = String(array[1])
        }
        
        picker.modalPresentationStyle = .overFullScreen
        picker.loadViewIfNeeded()
        self.present(picker, animated: false, completion: nil)
    }
    
    @objc func willLocationSearchSheetOpen(){
        let vc = SearchAddressBottomSheet()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func registerBtnDidClicked(){
        self.dismiss(animated: true, completion: nil)
    }

}
