//
//  ChattingRoomViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/17.
//

import UIKit
import SideMenu

enum ChatType{
    case RightMessage
    case RightImage
    case LeftMessage
    case LeftImage
}

struct ChatMessage{
    let message: String
    let chatType: ChatType
    //TODO: 전송 시간 기준 프론트? 서버?
}

class ChattingRoomViewController: BaseViewController {

    //MARK: - Properties
    var memberBlockBottomSheet: MemberDeclarationBottomSheet?
    var sideMenuViewController : ChattingSideSheetViewController?
    
    var messageData: [ChatMessage] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    //MARK: - UI
    let nameLabel = UILabel().then{
        $0.text = "쑤야"
        $0.font = UIFont.pretendard(size: 18, family: .Bold)
        $0.textColor = .black85
    }
    
    let townLabel = UILabel().then{
        $0.text = "중계동"
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textColor = .zatchPurple
    }
    
    let reservationFinishTag = UILabel().then{
        $0.text = "예약완료"
        $0.textAlignment = .center
        $0.font = UIFont.pretendard(size: 13, family: .Bold)
        $0.textColor = .white
        $0.backgroundColor = .zatchPurple
        $0.layer.cornerRadius = 24/2
        $0.clipsToBounds = true
    }
    
    lazy var etcBtn = UIButton().then{
        $0.setImage(UIImage(named: "dot"), for: .normal)
        $0.addTarget(self, action: #selector(sideSheetWillOpen), for: .touchUpInside)
    }
    
    let matchBannerView = ChattingMatchBannerView()
    
    var tableView: UITableView!
    
    let chatBottomFrame = UIStackView().then{
        $0.axis = .vertical
        $0.spacing = 0
        $0.alignment = .leading
    }
    
    let chatInputView = ChatInputView().then{
        $0.etcBtn.addTarget(self, action: #selector(chatEtcBtnDidClicked), for: .touchUpInside)
        $0.sendBtn.addTarget(self, action: #selector(chatSendBtnDidClicked), for: .touchUpInside)
    }
    
    let chatEtcBtnView = ChatEtcBtnView().then{
        $0.cameraBtn.addTarget(self, action: #selector(cameraBtnDidClicked), for: .touchUpInside) 
        $0.galleryBtn.addTarget(self, action: #selector(galleryBtnDidClicked), for: .touchUpInside)
        $0.appointmentBtn.addTarget(self, action: #selector(appointmentBtnDidClicked), for: .touchUpInside)
    }
    
    let blurView = UIView().then{
        $0.backgroundColor = UIColor(red: 38/255, green: 38/255, blue: 38/255, alpha: 0.6)
    }

    //MARK: - LifeCycle
    override func viewDidLoad(){
        
        super.viewDidLoad()

        setInitView()
        setUpView()
        setUpConstraint()
    }
    
    //MARK: - Action
    
    @objc func chatSendBtnDidClicked(){
        let newMessage = ChatMessage(message: chatInputView.chatTextField.text!,
                                     chatType: .RightMessage)
        
        self.messageData.append(newMessage)
        self.chatInputView.sendBtn.isEnabled = false
        self.chatInputView.chatTextField.text = nil
    }
    
    //채팅 하단 기타 기능 함수
    @objc func chatEtcBtnDidClicked(){
        
        chatInputView.etcBtn.isSelected.toggle()
        
        if(chatInputView.etcBtn.isSelected){
            chatBottomFrame.addArrangedSubview(chatEtcBtnView)
        }else{
            self.chatEtcBtnView.removeFromSuperview()
        }
    }
    
    @objc func cameraBtnDidClicked(){
        
        let cameraPicker = UIImagePickerController().then{
            $0.delegate = self
            $0.sourceType = .camera
        }

        self.navigationController?.present(cameraPicker, animated: true, completion: nil)
    }
    
    @objc func galleryBtnDidClicked(){
        
        let imagePicker = UIImagePickerController().then{
            $0.delegate = self
            $0.sourceType = .photoLibrary
        }
        
        self.navigationController?.present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func appointmentBtnDidClicked(){
        
    }
    
    //오른쪽 기타 메뉴 함수
    @objc func sideSheetWillOpen(){
        
        sideMenuViewController = ChattingSideSheetViewController()
        
        guard let sideMenu = sideMenuViewController else { return }
        
        let exitGesture = UITapGestureRecognizer(target: self, action: #selector(chattingRoomExitBtnDidClicked))
        sideMenu.exitTitle.addGestureRecognizer(exitGesture)
        
        sideMenu.declarationHandler = { indexPath in
            print(indexPath)
            
            sideMenu.dismiss(animated: true, completion: {
                self.memberBlockBottomSheet = MemberDeclarationBottomSheet()
                
                let blockGesture = UITapGestureRecognizer(target: self, action: #selector(self.memberBlockBtnDidClicked))
                self.memberBlockBottomSheet!.blockBtn.addGestureRecognizer(blockGesture)
                
                let declarationGesture = UITapGestureRecognizer(target: self, action: #selector(self.memberDeclarationBtnDidClicked))
                self.memberBlockBottomSheet!.blockBtn.addGestureRecognizer(declarationGesture)
                
                self.memberBlockBottomSheet!.loadViewIfNeeded()
                self.present(self.memberBlockBottomSheet!, animated: true, completion: nil)
            })
        }
        
        let menu = SideMenuNavigationController(rootViewController: sideMenu)
        
        let deviceWidth = UIScreen.main.bounds.size.width
        
        menu.menuWidth = 276 / 360 * deviceWidth
        menu.presentationStyle = .menuSlideIn
        menu.delegate = self
        
        present(menu, animated: true, completion: nil)

    }
    
    @objc func chattingRoomExitBtnDidClicked(){
        
        sideMenuViewController?.dismiss(animated: true, completion: {
            let alert = CancelOkAlertViewController(message: "채팅방을 나가시겠습니까?\n채팅방을 나가면 채팅 내역은 복구되지 않습니다.",
                                                    btnTitle: "네, 확인했습니다.")
            
            alert.alertHandler = { isExit in
                self.navigationController?.popViewController(animated: true)
            }
            
            alert.modalPresentationStyle = .overFullScreen
            self.present(alert, animated: false, completion: nil)
        })
    }
    
    @objc func memberBlockBtnDidClicked(){
        
        guard let bottomSheet = memberBlockBottomSheet else { return }
        
        let alert = CancelOkAlertViewController(message: "한민지님을 차단하시겠습니까?\n더 이상의 대화가 불가합니다.",
                                                btnTitle: "네, 차단합니다.")
        
        alert.alertHandler = { isBlock in
            if(isBlock){
                print("차단 완료")
                bottomSheet.dismiss(animated: true, completion: nil)
            }
        }
        
        alert.modalPresentationStyle = .overFullScreen
        bottomSheet.present(alert, animated: false, completion: nil)
    }
    
    @objc func memberDeclarationBtnDidClicked(){
        
    }

    
    //MARK: - Helper
    

}

extension ChattingRoomViewController: UITextViewDelegate{
    
    func textViewDidChange(_ textView: UITextView) {
        chatInputView.sendBtn.isEnabled = textView.text.isEmpty ? false : true
    }
}

extension ChattingRoomViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatData = messageData[indexPath.row]
        
        switch chatData.chatType {
        case .RightMessage:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RightChattingMessageTableViewCell.cellIdentifier, for: indexPath) as? RightChattingMessageTableViewCell else { fatalError() }
            cell.messageLabel.text = chatData.message
            return cell
            
        case .RightImage:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RightChattingImageTableViewCell.cellIdentifier, for: indexPath) as? RightChattingImageTableViewCell else { return UITableViewCell() }
            return cell
            
        case .LeftMessage:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LeftChattingMessageTableViewCell.cellIdentifier, for: indexPath) as? LeftChattingMessageTableViewCell else { return UITableViewCell() }
            cell.messageLabel.text = chatData.message
            return cell
            
        case .LeftImage:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LeftChattingImageTableViewCell.cellIdentifier, for: indexPath) as? LeftChattingImageTableViewCell else { return UITableViewCell() }
            return cell
        }
    }
    
    
}


extension ChattingRoomViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        let imgae = info[.originalImage] as! UIImage
        
        let imageDetailVC = RegisterImageDetailViewController()
        
        imageDetailVC.okBtn.setTitle("전송", for: .normal)
        imageDetailVC.imageView.image = imgae
        imageDetailVC.imageDetailHandler = { result in
            if(result){
//                self.imageArray.append(imgae)
//                self.imageCollectionView.reloadData()
            }
        }
        
        self.navigationController?.pushViewController(imageDetailVC, animated: true)
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
}


//MARK: - SideMenuDelegate
extension ChattingRoomViewController: SideMenuNavigationControllerDelegate{
    
    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool){
        
        self.view.addSubview(self.blurView)
        
        self.blurView.snp.makeConstraints{ make in
            make.width.height.equalToSuperview()
        }
    }
    
    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool){
        self.blurView.removeFromSuperview()
    }
}
