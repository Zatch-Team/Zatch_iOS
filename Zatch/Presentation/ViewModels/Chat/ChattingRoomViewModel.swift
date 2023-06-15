//
//  ChattingRoomViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/23.
//

import Foundation
import RxSwift
import RxCocoa

protocol ChattingRoomViewModelInterface: BaseViewModel, BlockUserInterface, DeclarationUserInterface{
    var messages: [ChatMessage] { get }
    func requestChattingMembers()
}

protocol BlockUserInterface{
    var chattingmMembers: [ChattingMember] { get }
    var blockUserIndexSubject: PublishSubject<Int> { get }
}

protocol DeclarationUserInterface{
    var declarationUserResponse: PublishSubject<ResponseState> { get }
    func declarationUser(index: Int, reason: Int)
}

class ChattingRoomViewModel: ChattingRoomViewModelInterface{
    var messages = [ChatMessage]()
    var chattingmMembers = [ChattingMember]()
    
    let blockUserIndexSubject = PublishSubject<Int>()
    let declarationUserResponse = PublishSubject<ResponseState>()
    
    private let roomId: String
    private let blockUserUseCase: BlockUserUseCaseInterface
    private let declarationUserUseCase: DeclarationUserUseCaseInterface
    private let exitRoomUseCase: ExitChattingRoomUseCaseInterface
    private let getChattingMemberListUseCase: GetMemberListOfChattingUseCaseInterface

    init(roomId: String = "0",
         blockUserUseCase: BlockUserUseCaseInterface = BlockUserUseCase(),
         declarationUserUseCase: DeclarationUserUseCaseInterface = DeclarationUserUseCase(),
         exitRoomUseCase: ExitChattingRoomUseCaseInterface = ExitChattingRoomUseCase(),
         getChattingMemberListUseCase: GetMemberListOfChattingUseCaseInterface = GetMemberListOfChattingUseCase()) {
        self.roomId = roomId
        self.blockUserUseCase = blockUserUseCase
        self.declarationUserUseCase = declarationUserUseCase
        self.exitRoomUseCase = exitRoomUseCase
        self.getChattingMemberListUseCase = getChattingMemberListUseCase
    }
    
    private let disposeBag = DisposeBag()

    struct Input{
        let messageObservable: Observable<String>
        let sendBtnTap: ControlEvent<Void>
        let exitBtnTap: Observable<Void>
    }
    
    struct Output{
//        let canSendMessage: Driver<Bool>
        let blockResponse: Observable<ResponseState>
        let exitResponse: Observable<ResponseState>
    }
    
    func transform(_ input: Input) -> Output{
        
        let exitResponse = input.exitBtnTap
            .flatMap{
                self.exitRoomUseCase.execute(roomId: self.roomId)
            }
        
        let blockResponse = blockUserIndexSubject
            .map{ index in
                self.chattingmMembers[index].userId
            }
            .flatMap{ userId in
                self.blockUserUseCase.execute(requestValue: BlockUserRequestModel(blockedUserId: userId))
            }
        
        return Output(blockResponse: blockResponse, exitResponse: exitResponse)
    }
    
    func requestChattingMembers() {
        //채팅방 멤버 조회
        getChattingMemberListUseCase
            .execute(roomId: roomId)
            .subscribe{ [weak self] in
                if let members = $0 {
                    self?.chattingmMembers = members
                }
            }.disposed(by: disposeBag)
        
        chattingmMembers = [ChattingMember(userId: 1, name: "쑤야", profileImageUrl: "23")]
    }
    
    func declarationUser(index: Int, reason: Int){
        declarationUserUseCase
            .execute(requestValue: DeclarationRequestModel(reason: reason, targetId: chattingmMembers[index].userId))
            .subscribe{ [weak self] in
                self?.declarationUserResponse.onNext($0)
            }.disposed(by: disposeBag)
    }
}
