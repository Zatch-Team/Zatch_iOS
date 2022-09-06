//
//  SheetNavigationViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/06.
//

import UIKit

class SheetNavigationViewController: UINavigationController, UIViewControllerTransitioningDelegate{

    override func viewDidLoad() {

        super.viewDidLoad()

        modalPresentationStyle = .custom
        transitioningDelegate = self

        self.view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true

    }

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {

        let controller: UISheetPresentationController = .init(presentedViewController: presented, presenting: presenting)

        let detent: UISheetPresentationController.Detent = ._detent(withIdentifier: "Test1", constant: 342 * Const.deviceHeight / 718)

        controller.detents = [detent]
        controller.preferredCornerRadius = 28
        controller.prefersGrabberVisible = false

        return controller
    }
}
