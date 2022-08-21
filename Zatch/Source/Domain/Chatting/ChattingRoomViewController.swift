//
//  ChattingRoomViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/17.
//

import UIKit

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
    
    let etcBtn = UIButton().then{
        $0.setImage(UIImage(named: "dot"), for: .normal)
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
