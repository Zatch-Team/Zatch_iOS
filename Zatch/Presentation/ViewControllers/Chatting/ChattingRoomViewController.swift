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

final class ChattingRoomViewController: BaseViewController<ChattingRoomHeaderView, ChattingRoomView> {

    init(){
        super.init(headerView: ChattingRoomHeaderView(), mainView: ChattingRoomView())
    }
    
    required init?(coder: NSCoder) {
        super.init(headerView: ChattingRoomHeaderView(), mainView: ChattingRoomView())
    }
    
    private var willBlockUserIndex: Int?
    private var sideMenuInsideVC: ChattingSideSheetViewController!
    private var sideVC: SideMenuNavigationController!
    
    private let viewModel = ChattingRoomViewModel()
    private let blockBottomSheet = MemberDeclarationSheetViewController()
    private let exitRoomAlert = Alert.ChattingRoomExit.getInstance()
    
    private let cameraPickerVC = UIImagePickerController()
    private let imagePickerVC = UIImagePickerController()

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
        setPickerViewControllerDelegate()
        initializeSideViewController()
        initializeBlockBottomSheet()
    }
    
    private func initializeSideViewController(){
        
        sideMenuInsideVC = ChattingSideSheetViewController(viewModel: viewModel).then{
            $0.delegate = self
        }
        
        sideVC = SideMenuNavigationController(rootViewController: sideMenuInsideVC).then{
            $0.menuWidth = 300 / 390 * Device.width
            $0.presentationStyle = .menuSlideIn
            $0.delegate = self
        }
    }
    
    private func initializeBlockBottomSheet(){
        let blockGesture = UITapGestureRecognizer(target: self, action: #selector(self.memberBlockBtnDidClicked))
        let declarationGesture = UITapGestureRecognizer(target: self, action: #selector(self.memberDeclarationBtnDidClicked))
        
        blockBottomSheet.blockBtn.addGestureRecognizer(blockGesture)
        blockBottomSheet.declarationBtn.addGestureRecognizer(declarationGesture)
    }
    
    private func setPickerViewControllerDelegate(){
        cameraPickerVC.do{
            $0.delegate = self
            $0.sourceType = .camera
        }
        imagePickerVC.do{
            $0.delegate = self
            $0.sourceType = .photoLibrary
        }
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
        let input = ChattingRoomViewModel.Input(
            messageObservable: mainView.chatInputView.chatTextField.rx.text.orEmpty.asObservable(),
            sendBtnTap: mainView.chatInputView.sendBtn.rx.tap,
            exitBtnTap: exitRoomAlert.complete
        )
        let output = viewModel.transform(input)
//        output.exitResponse
//            .subscribe{ [weak self] in
//                if $0 == .success {
//                    self?.navigationController?.popViewController(animated: true)
//                }
//            }.disposed(by: disposeBag)
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
    
    @objc private func cameraBtnDidClicked(){
        navigationController?.present(cameraPickerVC, animated: true, completion: nil)
    }
    
    @objc private func galleryBtnDidClicked(){
        navigationController?.present(imagePickerVC, animated: true, completion: nil)
    }
    
    @objc func appointmentBtnDidClicked(){
        let bottomSheet = SheetNavigationViewController(rootViewController: MakeMeetingSheetViewController())
        
        bottomSheet.loadViewIfNeeded()
        
        present(bottomSheet, animated: true, completion: nil)
    }
    
    //오른쪽 기타 메뉴 함수
    @objc private func sideSheetWillOpen(){
        present(sideVC, animated: true, completion: nil)
    }
    
    @objc func memberBlockBtnDidClicked(){
        let alert = Alert.Block(user: "쑤야").show(in: blockBottomSheet)
        alert.completion = { [weak self] in
            defer{
                self?.willBlockUserIndex = nil
            }
            guard let willBlockUserIndex = self?.willBlockUserIndex else { return }
            self?.viewModel.blockUserIndexSubject.onNext(willBlockUserIndex)
            self?.blockBottomSheet.dismiss(animated: true)
        }
    }
    
    @objc func memberDeclarationBtnDidClicked(){
        //TODO: 신고 팝업 UI 추가 작업 필요
    }

    @objc private func goOthersProfile() {
        navigationController?.pushViewController(OthersProfileViewController(nickName: "쑤야"), animated: true)
    }
}

extension ChattingRoomViewController: ChattingSideMenuDelegate{
    
    func willShowDeclarationBottomSheet(index: Int) {
        willBlockUserIndex = index
        sideMenuInsideVC.dismiss(animated: true, completion: {
            self.blockBottomSheet.show(in: self)
        })
    }
    
    func willShowExitRoomAlert() {
        sideVC.dismiss(animated: true, completion: {
            self.exitRoomAlert.show(in: self)
        })
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

