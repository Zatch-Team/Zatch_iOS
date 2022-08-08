//
//  SheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/07.
//

import UIKit

enum BottomSheetSize: CGFloat{
    case SearchTag = 219
    case Category = 524
}

class SheetViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    var sheetType: BottomSheetSize!

    override func viewDidLoad() {
        
        super.viewDidLoad()

        modalPresentationStyle = .custom
        transitioningDelegate = self
    }

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let controller: UISheetPresentationController = .init(presentedViewController: presented, presenting: presenting)
        
        let detent: UISheetPresentationController.Detent = ._detent(withIdentifier: "Test1", constant: sheetType.rawValue)
    
        controller.detents = [detent]
        controller.preferredCornerRadius = 28
        controller.prefersGrabberVisible = true
        
        return controller
    }

}
