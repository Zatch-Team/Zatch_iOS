//
//  ModifyProfileViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/26.
//

import Foundation
import RxSwift
import RxCocoa

class ModifyProfileViewModel: BaseViewModel{
    
    private let modifyProfileImageUseCase: ModifyProfileImageUseCaseInterface
    private let modifyNicknameUseCase: ModifyProfileUseCaseInterface
    
    init(modifyProfileImageUseCase: ModifyProfileImageUseCaseInterface = ModifyProfileImageUseCase(),
         modifyNicknameUseCase: ModifyProfileUseCaseInterface = ModifyProfileUseCase()){
        self.modifyProfileImageUseCase = modifyProfileImageUseCase
        self.modifyNicknameUseCase = modifyNicknameUseCase
    }
    
    private var isRequest = (profile: false, profileImage: false)
    
    struct Input{
        let currentNickname: String
        let profileImage: Observable<UIImage?>
        let nicknameText: Observable<String>
        let registerButtonTap: ControlEvent<Void>
    }
    
    struct Output{
        let nickname: Driver<String> //8자 제한
        let responseState: Observable<RequestResponse>
    }
    
    func transform(_ input: Input) -> Output{
        
        let registerBtnTap = input.registerButtonTap
            .share()

        let nickname = input.nicknameText
            .map{
                TextConverter.getValidateRangeString($0, limit: 8)
            }
        
        let nicknameBinding = nickname
            .asDriver(onErrorJustReturn: "")
        
        let nicknameResponse =  registerBtnTap
            .withLatestFrom(nickname)
            .filter{
                $0 != input.currentNickname
            }
            .do(onNext: { [weak self] _ in
                self?.isRequest.profile = true
            })
            .flatMap{
                self.modifyNicknameUseCase.execute(
                    requestValue: ModifyProfileRequestModel(newNickname: $0)
                )
            }

        let profileImageResponse = registerBtnTap
            .withLatestFrom(input.profileImage)
            .compactMap{
                $0
            }
            .do(onNext: { [weak self] _ in
                self?.isRequest.profileImage = true
            })
            .flatMap{
                self.modifyProfileImageUseCase.execute(requestValue: $0)
            }
        
        let responseObservable = Observable.combineLatest( //api 요청 필요 없는 경우(isRequest false인 경우) 성공했다고 가정해 Observable 생성
            isRequest.profile ? nicknameResponse : Observable.of(200),
            isRequest.profileImage ? profileImageResponse : Observable.of(200)
        ).map{ profile, profileImage in
            profile == 200 && profileImage == 200 ? RequestResponse.success : .fail
        }

        return Output(nickname: nicknameBinding,
                      responseState: responseObservable)
    }
}
