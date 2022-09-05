//
//  ChattingListTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/16.
//

import UIKit

enum CurrentHidden{
    case none
    case left
    case right
}

class ChattingListTableViewCell: BaseTableViewCell {
    
    //MARK: - Properties
    
    static let cellIdentifier = "chattingListCell"
    
    weak var delegate : SelectedTableViewCellDeliver?
    
    var navigationController: UINavigationController!
    
    //MARK: - Properties(for swipe)
    
    lazy var leftWidth : CGFloat = 130
    lazy var rightWidth : CGFloat = 72
    
    //hiddenView addSubView 되었는지 아닌지 확인 용도
    lazy var isViewAdd : CurrentHidden = .none
    
    lazy var originalCenter = CGPoint()
    
    lazy var isClamp = false
    
    //MARK: - UI
    
    let nameLabel = UILabel().then{
        $0.text = "쑤야"
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
    }
    
    let profileImage = UIImageView().then{
        $0.image = UIImage(named: "zatch_profile")
    }
    
    let recentMessageLabel = UILabel().then{
        $0.text = "문의드립니다."
        $0.textColor = .black85
        $0.numberOfLines = 1
        $0.font = UIFont.pretendard(size: 12, family: .Regular)
    }
    
    let timeLabel = UILabel().then{
        $0.textAlignment = .center
        $0.text = "오후 7:13"
        $0.textColor = UIColor(red: 166/255, green: 166/255, blue: 166/255, alpha: 1)
        $0.font = UIFont.pretendard(size: 10, family: .Regular)
    }
    
    let borderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    let infoStackView = UIStackView().then{
        $0.axis = .vertical
        $0.spacing = 7
    }
    
    lazy var hiddenLeftView = HiddenZatchInfoView()
    
    lazy var hiddenRightView = HiddenDeleteView()
    
    lazy var hiddenDeleteBtn = UIButton().then{
        $0.backgroundColor = .transparent
        $0.setTitle("나가기", for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(size: 14, family: .Bold)
        $0.titleLabel?.textAlignment = .center
        $0.addTarget(self, action: #selector(deleteBtnDidClicked), for: .touchUpInside)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstraint()
        
        let swipeGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        
        swipeGesture.delegate = self
        baseView.addGestureRecognizer(swipeGesture)
        
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func deleteBtnDidClicked(){
        let alert = CancelOkAlertViewController(
            message: "채팅방을 나가시겠습니까?\n채팅방을 나가면 채팅 내역은 복구되지 않습니다.",
            btnTitle: "네, 확인했습니다.")
        
        alert.alertHandler = { result in
            if(result){
                //TODO: - 채팅방 삭제 API 연결 -> VC에서 데이터 삭제 및 테이블 뷰 reload
                /*
                 chattingList.remove(at: indexPath.row)
                 tableView.reloadData()
                 */
            }
            self.cellWillMoveOriginalPosition()
        }

        alert.modalPresentationStyle = .overFullScreen
        
        self.navigationController.present(alert, animated: false, completion: nil)
    }
    

}

extension ChattingListTableViewCell{
    
    @objc
    func handlePan(_ recognizer: UIPanGestureRecognizer){

        let translation = recognizer.translation(in: self)
        let superView = self.superview?.superview
        
        if(recognizer.state == .began){
            originalCenter = center
            hiddenSettingViewShow(translation)
        }
        
        if (recognizer.state == .changed){
            
            center = CGPoint(x: originalCenter.x + translation.x, y: originalCenter.y)

            if(frame.origin.x > 0){ //왼쪽 view
                isClamp = frame.origin.x > leftWidth * 1.2 && isViewAdd != .right
            }else{  //오른쪽 view
                isClamp = frame.origin.x < -rightWidth * 1.2   && isViewAdd != .left
            }
        }
        if recognizer.state == .ended {
            if !isClamp {
                cellWillMoveOriginalPosition()
            }
            else{
                guard let indexPath = getCellIndexPath() else { fatalError("indexPath casting error") }
                
                delegate?.cellWillClamp(indexPath)
                
                let clampFrame : CGRect!
                if(frame.origin.x < 0){
                    clampFrame = CGRect(x: -rightWidth,
                                        y: frame.origin.y,
                                        width: bounds.size.width,
                                        height: bounds.size.height)
                    superView?.bringSubviewToFront(hiddenDeleteBtn)
                    UIView.animate(withDuration: 0.32, animations: {self.frame = clampFrame})
                }else{
                    let parentX = UIScreen.main.bounds.size.width
                    clampFrame = CGRect(x: parentX,
                                        y: frame.origin.y,
                                        width: bounds.size.width,
                                        height: bounds.size.height)
                    
                    UIView.animate(withDuration: 0.4, animations: {self.frame = clampFrame})
                }
                
            }
        }
    }

    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {

        if let panGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
            let translation = panGestureRecognizer.translation(in: superview)
//            isViewAdd = translation.x > 0 ? .left : .right
            if abs(translation.x) > abs(translation.y) {
                return true
            }
            return false
        }
        return false
    }
    
    func moveBackHiddenView(){
        
        let superView = self.superview?.superview
        
        superView?.sendSubviewToBack(self.hiddenLeftView)
        superView?.sendSubviewToBack(self.hiddenDeleteBtn)
        superView?.sendSubviewToBack(self.hiddenRightView)
    }
    
    func removeHiddenViews(){

        hiddenRightView.removeFromSuperview()
        hiddenLeftView.removeFromSuperview()
        hiddenDeleteBtn.removeFromSuperview()
        
        isViewAdd = .none
    }
    
    func hiddenSettingViewShow(_ transition: CGPoint){
        
        if(isViewAdd == .none && !isClamp){
            isViewAdd = transition.x > 0 ? .left : .right
        }
        
        if(isViewAdd == .left && !isClamp){
            self.superview?.superview?.addSubview(hiddenLeftView)
            self.superview?.superview?.sendSubviewToBack(hiddenLeftView)

            hiddenLeftView.snp.makeConstraints{ make in
                make.leading.trailing.equalToSuperview()
                make.top.equalTo(self.contentView)
                make.bottom.equalTo(self.contentView)
            }

        }else if(isViewAdd == .right && !isClamp){
            self.superview?.superview?.addSubview(hiddenRightView)
            self.superview?.superview?.addSubview(hiddenDeleteBtn)

            self.superview?.superview?.sendSubviewToBack(hiddenDeleteBtn)
            self.superview?.superview?.sendSubviewToBack(hiddenRightView)

            hiddenRightView.snp.makeConstraints{ make in
                make.leading.trailing.equalToSuperview()
                make.top.equalTo(self.contentView)
                make.bottom.equalTo(self.contentView)
            }

            hiddenDeleteBtn.snp.makeConstraints{ make in
                make.width.equalTo(72)
                make.top.equalTo(self.contentView)
                make.bottom.equalTo(self.contentView)
                make.trailing.equalToSuperview()
            }
        }
    }
        
    func getCellIndexPath() -> IndexPath?{
        return (self.superview as? UITableView)?.indexPath(for: self)
    }
    
    func cellWillMoveOriginalPosition(){
        
        let originalFrame = CGRect(x: 0,
                                   y: frame.origin.y,
                                   width: bounds.size.width,
                                   height: bounds.size.height)
        
        moveBackHiddenView()
        UIView.animate(withDuration: 0.25,
                       animations: { self.frame = originalFrame },
                       completion: { _ in
            self.isViewAdd = .none
            self.removeHiddenViews()
        })
        isClamp = false
    }
}

protocol SelectedTableViewCellDeliver: AnyObject{
    func cellWillClamp(_ indexPath: IndexPath)
}
