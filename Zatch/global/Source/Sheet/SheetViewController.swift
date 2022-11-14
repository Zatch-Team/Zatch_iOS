//
//  SheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/07.
//

import UIKit

class SheetViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    //MARK: - Properties
    
    var bottomSheetType: BottomSheetType!{
        didSet{
            self.titleLabel.text = bottomSheetType.title
        }
    }
    
    let titleLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.textColor = .black85
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        style()
        initialize()
        layout()
    }

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let controller: UISheetPresentationController = .init(presentedViewController: presented, presenting: presenting)
        
        let detent: UISheetPresentationController.Detent = ._detent(withIdentifier: "Detent1", constant: bottomSheetType.sheetHeight * Const.Device.DEVICE_HEIGHT / 810)
    
        controller.detents = [detent]
        controller.preferredCornerRadius = 28
        controller.prefersGrabberVisible = bottomSheetType.grabberVisibility
        
        return controller
    }
    
    func style(){
        self.view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func initialize() {
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    func layout() {
        
        self.view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
        }
    }
    
    func setBottomSheetStyle(type: BottomSheetType){
        self.bottomSheetType = type
    }

}

/*
 override func style(){
     
     super.style()
     
     self.setBottomSheetStyle(type: .SearchMyTag)
 }
 
 override func initialize() {
     super.initialize()
 }
 
 override func layout() {
     super.layout()
 }
 */
