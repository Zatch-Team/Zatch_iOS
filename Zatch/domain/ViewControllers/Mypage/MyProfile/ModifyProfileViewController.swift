//
//  ModifyProfileViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/19.
//

import UIKit

class ModifyProfileViewController: BaseCenterTitleViewController {
    var modifyProfileView: ModifyProfileView!
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
    override func rightPositionBtnDidClicked() {
        
        let alert = Alert.ChangeNickname.generateAlert().show(in: self)
        
        alert.confirmHandler = {
            print("ok")
        }
    }
}
// MARK: - Actions & Functions
extension ModifyProfileViewController {
    func setNavigationView() {
        self.navigationTitle.text = "프로필 편집"
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
