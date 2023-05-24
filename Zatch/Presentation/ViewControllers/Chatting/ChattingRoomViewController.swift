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
    let message: String?
    let image: UIImage?
    let chatType: ChatType
    //TODO: 전송 시간 기준 프론트? 서버?
}

class ChattingRoomViewController: BaseViewController<ChattingRoomHeaderView, ChattingRoomView> {

    //MARK: - Properties
    var memberBlockBottomSheet: MemberDeclarationSheetViewController?
    var sideMenuViewController : ChattingSideSheetViewController?

    init(){
        super.init(headerView: ChattingRoomHeaderView(), mainView: ChattingRoomView())
    }
    
    required init?(coder: NSCoder) {
        super.init(headerView: ChattingRoomHeaderView(), mainView: ChattingRoomView())
    }
    
    private let viewModel = ChattingRoomViewModel()
    private let blurView = UIView().then{
        $0.backgroundColor = .popupBackgroundColor
    }
    
    //MARK: - Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    override func initialize() {
        super.initialize()
        setViewGesture()
        setHeaderViewAction()
        setInputViewTarget()
        setEtcViewTarget()
        setTableViewDelegate()
    }
    
    private func setViewGesture(){
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewDidTapped)))
    }
    
    private func setHeaderViewAction(){
        headerView.etcButton.addTarget(self, action: #selector(sideSheetWillOpen), for: .touchUpInside)
        headerView.opponentNameLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goOthersProfile)))
    }
    
    private func setInputViewTarget(){
        mainView.chatInputView.chatTextField.delegate = self
        mainView.chatInputView.etcBtn.addTarget(self, action: #selector(chatEtcBtnDidClicked), for: .touchUpInside)
        mainView.chatInputView.sendBtn.addTarget(self, action: #selector(chatSendBtnDidClicked), for: .touchUpInside)
    }
    
    private func setEtcViewTarget(){
        mainView.chatEtcBtnView.cameraStackView.button.addTarget(self, action: #selector(cameraBtnDidClicked), for: .touchUpInside)
        mainView.chatEtcBtnView.galleryStackView.button.addTarget(self, action: #selector(galleryBtnDidClicked), for: .touchUpInside)
        mainView.chatEtcBtnView.appointmentStackView.button.addTarget(self, action: #selector(appointmentBtnDidClicked), for: .touchUpInside)
    }
    
    private func setTableViewDelegate(){
        mainView.tableView.initializeDelegate(self)
    }
    
    override func bind() {
        let input = ChattingRoomViewModel.Input()
        let output = viewModel.transform(input)
    }
    
    //MARK: - Action
    
    @objc func viewDidTapped(){
        view.endEditing(true)
    }
    
    @objc func chatSendBtnDidClicked(){
        
        let newMessage = ChatMessage(message: mainView.chatInputView.chatTextField.text!,
                                     image: nil,
                                     chatType: .RightMessage)
        
//        messageData.append(newMessage)
        mainView.chatInputView.sendBtn.isEnabled = false
        mainView.chatInputView.chatTextField.text = nil

    }
    
    //채팅 하단 기타 기능 함수
    @objc func chatEtcBtnDidClicked(){
        
        mainView.chatInputView.etcBtn.isSelected.toggle()
        
        if mainView.chatInputView.etcBtn.isSelected {
            mainView.chatBottomFrame.addArrangedSubview(mainView.chatEtcBtnView)
        }else{
            mainView.chatEtcBtnView.removeFromSuperview()
        }
    }
    
    @objc func cameraBtnDidClicked(){
        
        let cameraPicker = UIImagePickerController().then{
            $0.delegate = self
            $0.sourceType = .camera
        }

        navigationController?.present(cameraPicker, animated: true, completion: nil)
    }
    
    @objc func galleryBtnDidClicked(){
        
        let imagePicker = UIImagePickerController().then{
            $0.delegate = self
            $0.sourceType = .photoLibrary
        }
        
        navigationController?.present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func appointmentBtnDidClicked(){
        let bottomSheet = SheetNavigationViewController(rootViewController: MakeMeetingSheetViewController())
        
        bottomSheet.loadViewIfNeeded()
        
        present(bottomSheet, animated: true, completion: nil)
    }
    
    //오른쪽 기타 메뉴 함수
    @objc func sideSheetWillOpen(){
        
        sideMenuViewController = ChattingSideSheetViewController()
        
        guard let sideMenu = sideMenuViewController else { return }
        
        sideMenu.mainView.exitStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(chattingRoomExitBtnDidClicked)))
        
        sideMenu.declarationHandler = { indexPath in
            print(indexPath)
            
            sideMenu.dismiss(animated: true, completion: {
                self.memberBlockBottomSheet = MemberDeclarationSheetViewController()
                
                let blockGesture = UITapGestureRecognizer(target: self, action: #selector(self.memberBlockBtnDidClicked))
                self.memberBlockBottomSheet!.blockBtn.addGestureRecognizer(blockGesture)
                
                let declarationGesture = UITapGestureRecognizer(target: self, action: #selector(self.memberDeclarationBtnDidClicked))
                self.memberBlockBottomSheet!.declarationBtn.addGestureRecognizer(declarationGesture)
                
                self.memberBlockBottomSheet!.loadViewIfNeeded()
                self.present(self.memberBlockBottomSheet!, animated: true, completion: nil)
            })
        }
        
        let menu = SideMenuNavigationController(rootViewController: sideMenu)
        
        let deviceWidth = UIScreen.main.bounds.size.width
        
        menu.menuWidth = 300 / 390 * deviceWidth
        menu.presentationStyle = .menuSlideIn
        menu.delegate = self
        
        present(menu, animated: true, completion: nil)

    }
    
    @objc func chattingRoomExitBtnDidClicked(){
        
        sideMenuViewController?.dismiss(animated: true, completion: {

            let alert = Alert.ChattingRoomExit.show(in: self)
            
            alert.completion = {
                self.navigationController?.popViewController(animated: true)
            }
        })
    }
    
    @objc func memberBlockBtnDidClicked(){
        
        print("block button click")
        
        guard let bottomSheet = memberBlockBottomSheet else { return }
        
        let alert = Alert.Block(user: "쑤야").show(in: bottomSheet)
        
        alert.completion = {
            print("차단 완료")
            bottomSheet.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func memberDeclarationBtnDidClicked(){
        
        print("declaration button click")
        
        guard let bottomSheet = memberBlockBottomSheet else { return }
        
        //TODO: 신고 팝업 UI 추가 작업 필요

    }

    @objc private func goOthersProfile() {
        navigationController?.pushViewController(OthersProfileViewController(nickName: "쑤야"), animated: true)
    }
}

extension ChattingRoomViewController: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        mainView.chatInputView.sendBtn.isEnabled = textView.text.isEmpty ? false : true
    }
}

extension ChattingRoomViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let chatData = viewModel.messages[indexPath.row]
        
        switch chatData.chatType {
        case .RightMessage:
            return tableView.dequeueReusableCell(for: indexPath, cellType: RightChattingMessageTableViewCell.self).then{
                $0.messageLabel.text = chatData.message
            }
        case .RightImage:
            return tableView.dequeueReusableCell(for: indexPath, cellType: RightChattingImageTableViewCell.self).then{
                $0.imageMessageView.image = chatData.image
            }
        case .LeftMessage:
            return tableView.dequeueReusableCell(for: indexPath, cellType: LeftChattingMessageTableViewCell.self).then{
                $0.messageLabel.text = chatData.message
            }
        case .LeftImage:
            return tableView.dequeueReusableCell(for: indexPath, cellType: LeftChattingImageTableViewCell.self).then{
                $0.imageMessageView.image = chatData.image
            }
        }
    }
    
    
}


extension ChattingRoomViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        let image = info[.originalImage] as! UIImage
        
//        let imageDetailVC = RegisterImageDetailViewController()
//
//        imageDetailVC.okBtn.setTitle("전송", for: .normal)
//        imageDetailVC.imageView.image = image
//        imageDetailVC.imageDetailHandler = { [self] result in
//            if(result){
//                let newChat = ChatMessage(message: nil, image: image, chatType: .RightImage)
//                self.messageData.append(newChat)
//            }
//        }
//
//        self.navigationController?.pushViewController(imageDetailVC, animated: true)

//        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
}


//MARK: - SideMenuDelegate
extension ChattingRoomViewController: SideMenuNavigationControllerDelegate{
    
    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool){
        view.addSubview(blurView)
        blurView.snp.makeConstraints{
            $0.width.height.equalToSuperview()
        }
    }
    
    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool){
        blurView.removeFromSuperview()
    }
}

