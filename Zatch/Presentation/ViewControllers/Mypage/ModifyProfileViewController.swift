//
//  ModifyProfileViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/19.
//

import UIKit
import RxSwift
import Kingfisher

struct ProfileDTO{
    let nickname: String
    let profileImage: String
}

class ModifyProfileViewController: BaseViewController<CenterNavigationEtcButtonHeaderView, ModifyProfileView> {
    
    private let nickname: String
    
    init(profile: ProfileDTO) {
        self.nickname = profile.nickname
        super.init(headerView: CenterNavigationEtcButtonHeaderView(title: "프로필 편집", etcButton: "저장"),
                   mainView: ModifyProfileView())
        mainView.userImage.kf.setImage(with: URL(string: profile.profileImage), placeholder: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let viewModel = ModifyProfileViewModel()
    private let profileImageSubject = BehaviorSubject<UIImage?>(value: nil)
    private let imagePickerController = UIImagePickerController().then{
        $0.sourceType = .photoLibrary
    }
    
    override func initialize() {
        super.initialize()
        setImagePickerDelegate()
        addBtnTarget()
    }
    
    private func setImagePickerDelegate(){
        imagePickerController.delegate = self
    }
    
    private func addBtnTarget(){
        mainView.cameraButton.addTarget(self, action: #selector(goAlbumButtonDidTapped), for: .touchUpInside)
    }
    
    override func bind() {
        
        profileImageSubject
            .skip(1) //profile image 변경 여부 확인 위한 초기값 nil 세팅 > 기존 값 바인딩 적용 위한 1회 skip
            .subscribe(onNext: { [weak self] in
                self?.mainView.userImage.image = $0
            }).disposed(by: disposeBag)
        
        let input = ModifyProfileViewModel.Input(
            currentNickname: nickname,
            profileImage: profileImageSubject.asObservable(),
            nicknameText: mainView.modifyTextfield.rx.text.orEmpty.asObservable().startWith(nickname),
            registerButtonTap: headerView.etcButton.rx.tap
        )
        
        let output = viewModel.transform(input)
        
        output.nickname
            .drive(mainView.modifyTextfield.rx.text)
            .disposed(by: disposeBag)
        
        output.responseState
            .subscribe(onNext: { [weak self] in
                if $0 == RequestResponse.success {
                    self?.viewControllerWillPop()
                }
            }).disposed(by: disposeBag)
    }

    @objc private func goAlbumButtonDidTapped() {
        present(imagePickerController, animated: true, completion: nil)
    }
}

// MARK: - ImagePicker Delegate
extension ModifyProfileViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImageSubject.onNext(image)
        }
        dismiss(animated: true, completion: nil)
    }
}
