//
//  ChattingRoomViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/17.
//

import UIKit
import SideMenu

class ChattingRoomViewController: BaseViewController {

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
    }
    
    let chatEtcBtnView = ChatEtcBtnView().then{
        $0.cameraBtn.addTarget(self, action: #selector(cameraBtnDidClicked), for: .touchUpInside) 
        $0.galleryBtn.addTarget(self, action: #selector(galleryBtnDidClicked), for: .touchUpInside)
        $0.appointmentBtn.addTarget(self, action: #selector(appointmentBtnDidClicked), for: .touchUpInside)
    }
    
    let blurView = UIView().then{
        $0.backgroundColor = UIColor(red: 38/255, green: 38/255, blue: 38/255, alpha: 0.6)
    }

    override func viewDidLoad(){
        
        super.viewDidLoad()

        setInitView()
        setUpView()
        setUpConstraint()
        
        tableView.backgroundColor = .red

    }
    
    //MARK: - Action
    
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
    
    @objc func sideSheetWillOpen(){
        
        let sideMenuVC = ChattingSideSheetViewController()
        
        sideMenuVC.declarationHandler = { indexPath in
            print(indexPath)
            
            sideMenuVC.dismiss(animated: true, completion: {
                let bottomSheet = MemberDeclarationBottomSheet()
                bottomSheet.loadViewIfNeeded()
                self.present(bottomSheet, animated: true, completion: nil)
            })
        }
        
        sideMenuVC.exitHandler = { isTapped in
            if(isTapped){
                sideMenuVC.dismiss(animated: true, completion: {
                    let alert = CancelOkAlertViewController(message: "채팅방을 나가시겠습니까?\n채팅방을 나가면 채팅 내역은 복구되지 않습니다.", btnTitle: "네, 확인했습니다.")
                    alert.okBtn.setTitle("네, 확인했습니다.", for: .normal)
                    alert.alertHandler = { isExit in
                        self.navigationController?.popViewController(animated: true)
                    }
                    alert.modalPresentationStyle = .overFullScreen
                    self.present(alert, animated: false, completion: nil)
                })
            }
            
        }
        
        let menu = SideMenuNavigationController(rootViewController: sideMenuVC)
        
        let deviceWidth = UIScreen.main.bounds.size.width
        
        menu.menuWidth = 276 / 360 * deviceWidth
        menu.presentationStyle = .menuSlideIn
        menu.delegate = self
        
        present(menu, animated: true, completion: nil)

    }
    
    //MARK: - Helper
    

}

extension ChattingRoomViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
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
