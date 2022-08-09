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
    
    static let DEVICE_HEIGHT = UIScreen.main.bounds.size.height
    
    var sheetType: BottomSheetSize!
    
    var grabberVisibility: Bool = false

    override func viewDidLoad() {
        
        super.viewDidLoad()

        modalPresentationStyle = .custom
        transitioningDelegate = self
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
