//
//  SheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/07.
//

import UIKit

enum BottomSheetSize: CGFloat{
    case SearchTag = 219
    case Category = 500
    case TownArea = 442
}

class SheetViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    //MARK: - Properties
    
    static let DEVICE_HEIGHT = UIScreen.main.bounds.size.height
    
    var sheetType: BottomSheetSize!
    
    var grabberVisibility: Bool = false
    
    //MARK: - UI
    let titleLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.textColor = .black85
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()

        modalPresentationStyle = .custom
        transitioningDelegate = self
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
        }
    }

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let controller: UISheetPresentationController = .init(presentedViewController: presented, presenting: presenting)
        
        let detent: UISheetPresentationController.Detent = ._detent(withIdentifier: "Test1", constant: sheetType.rawValue * SheetViewController.DEVICE_HEIGHT / 718)
    
        controller.detents = [detent]
        controller.preferredCornerRadius = 28
        controller.prefersGrabberVisible = grabberVisibility
        
        return controller
    }

}