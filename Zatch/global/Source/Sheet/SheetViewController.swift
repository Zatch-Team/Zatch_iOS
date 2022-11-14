//
//  SheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/07.
//

import UIKit

enum BottomSheetType{
    case SearchMyTag
    case SearchWantTag
    case Category
    case TownArea
    case Declaration
    case MakeMeeting
    case LocationChange
}

struct BottomSheetInfo{
    let title: String
    let sheetHeight: CGFloat
    let grabberVisibility: Bool = false
}

class SheetViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    //MARK: - Properties
    
    var bottomSheetType: BottomSheetType!
    
    let titleLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.textColor = .black85
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initialize()
        hierarchy()
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
        
        self.titleLabel.text = bottomSheetType.title
    }
    
    func initialize() {
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    func hierarchy() {
        self.view.addSubview(titleLabel)
    }
    
    func layout() {
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
        }
    }
    
    func setBottomSheetStyle(type: BottomSheetType){
        self.bottomSheetType = type
    }

}

extension BottomSheetType{
    
    var info: BottomSheetInfo{
        switch self{
        case .SearchMyTag:      return BottomSheetInfo(title: "내가 등록한 재치", sheetHeight: 219)
        case .SearchWantTag:    return BottomSheetInfo(title: "내가 찾는 재치", sheetHeight: 219)
        case .Category:         return BottomSheetInfo(title: "카테고리", sheetHeight: 524)
        case .TownArea:         return BottomSheetInfo(title: "동네 범위 설정", sheetHeight: 442)
        case .Declaration:      return BottomSheetInfo(title: "", sheetHeight: 128)
        case .MakeMeeting:      return BottomSheetInfo(title: "주소검색", sheetHeight: 324)
        case .LocationChange:   return BottomSheetInfo(title: "내 동네 변경하기", sheetHeight: 216)
        }
    }
    
    var sheetHeight: CGFloat{
        return self.info.sheetHeight
    }
    
    var title: String?{
        return self.info.title
    }
    
    var grabberVisibility: Bool{
        return self.info.grabberVisibility
    }
    
}
