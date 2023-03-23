//
//  SheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/07.
//

import UIKit

class BaseBottomSheetViewController<T>: UIViewController, UIViewControllerTransitioningDelegate {
    
    //MARK: - Properties
    
    private final let type: BottomSheet
    var completion: ((T) -> Void)!
    
    let titleLabel = UILabel().then{
        $0.setTypoStyleWithSingleLine(typoStyle: .bold18)
        $0.textColor = .black85
    }
    
    init(type: BottomSheet){
        self.type = type
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        style()
        initialize()
        layout()
    }

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let controller: UISheetPresentationController = .init(presentedViewController: presented, presenting: presenting)
        
        let detent: UISheetPresentationController.Detent = ._detent(withIdentifier: "Detent1", constant: type.sheetHeight * Const.Device.DEVICE_HEIGHT / 810)
    
        controller.detents = [detent]
        controller.preferredCornerRadius = 28
        controller.prefersGrabberVisible = type.grabberVisibility
        
        return controller
    }
    
    func style(){
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
    }
    
    func initialize() {
        modalPresentationStyle = .custom
        transitioningDelegate = self
        titleLabel.text = type.title
    }
    
    func layout() {
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
        }
    }
    
    @discardableResult
    func show(in viewController: UIViewController) -> Self{
        loadViewIfNeeded()
        viewController.present(self, animated: true)
        return self
    }
}
