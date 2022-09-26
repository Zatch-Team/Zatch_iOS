//
//  ModifyProfileViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/19.
//

import UIKit

class ModifyProfileViewController: BaseCenterTitleViewController {
    var modifyProfileView: ModifyProfileView!
    var saveButton: UIButton!
    // Image Properties
    let imagePickerController = UIImagePickerController()
    var selectedPhoto: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        // imagePicker delegate
        imagePickerController.delegate = self
        
        setNavigationView()
        setModifyProfileView()
    }
    
}
// MARK: - Actions & Functions
extension ModifyProfileViewController {
    func setNavigationView() {
        saveButton = UIButton().then{
            var config = UIButton.Configuration.plain()
            var attText = AttributedString.init("저장")
            
            attText.font = UIFont.pretendard(size: 16, family: .Bold)
            attText.foregroundColor = .black85
            config.attributedTitle = attText
            
            $0.configuration = config
        }
        
        self.navigationTitle.text = "프로필 편집"
        self.navigationView.addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(18)
            make.centerY.equalToSuperview()
        }
        saveButton.addTarget(self, action: #selector(alertDiaolog), for: .touchUpInside)
    }
    func setModifyProfileView() {
        modifyProfileView = ModifyProfileView()
        self.view.addSubview(modifyProfileView)
        
        modifyProfileView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(self.navigationView.snp.bottom)
        }
        
        modifyProfileView.cameraButton.addTarget(self, action: #selector(goAlbumButtonDidTap), for: .touchUpInside)
    }
    @objc func goAlbumButtonDidTap() {
        self.imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
    @objc func alertDiaolog() {
        let alert = CancelAlertViewController(message: "닉네임을 변경하시면 30일 동안 추가 변경이 불가능합니다. 변경하시겠습니까?", btnTitle: "확인")
        alert.modalPresentationStyle = .overFullScreen
        alert.confirmHandler = {
            print("ok")
        }
        self.present(alert, animated: false, completion: nil)
    }
}
// MARK: - ImagePicker Delegate
extension ModifyProfileViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.selectedPhoto = UIImage()
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.selectedPhoto = image
            self.modifyProfileView.userImage.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
}
