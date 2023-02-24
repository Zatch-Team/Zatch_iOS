//
//  ModifyProfileViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/19.
//

import UIKit

class ModifyProfileViewController: BaseViewController<CenterNavigationEtcButtonHeaderView, ModifyProfileView> {
    
    private let imagePickerController = UIImagePickerController()
    var selectedPhoto: UIImage!
    
    init() {
        super.init(headerView: CenterNavigationEtcButtonHeaderView(title: "프로필 편집", etcButton: "저장"), mainView: ModifyProfileView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize() {
        super.initialize()
        imagePickerController.delegate = self
        headerView.etcButton.addTarget(self, action: #selector(requestModifyProfile), for: .touchUpInside)
        mainView.cameraButton.addTarget(self, action: #selector(goAlbumButtonDidTapped), for: .touchUpInside)
    }
    
    @objc private func requestModifyProfile() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func goAlbumButtonDidTapped() {
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
            self.mainView.userImage.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
}
