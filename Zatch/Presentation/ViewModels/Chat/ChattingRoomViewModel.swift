//
//  ChattingRoomViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/23.
//

import Foundation
import RxSwift
import RxCocoa
import SocketIO

protocol ChattingRoomViewModelInterface: BaseViewModel, BlockUserInterface, DeclarationUserInterface{
    var addMessageSubject: PublishSubject<Void> { get }
    var messages: [ChatMessage] { get }
    func requestChattingMembers()
    func closeChat()
}

protocol BlockUserInterface{
    var chattingmMembers: [ChattingMember] { get }
    var blockUserIndexSubject: PublishSubject<Int> { get }
}

protocol DeclarationUserInterface{
    var declarationUserResponse: PublishSubject<ResponseState> { get }
    func declarationUser(index: Int, reason: Int)
}

class ChattingRoomViewModel: ChattingRoomViewModelInterface, SocketDelegate{
    
    var messages = [ChatMessage](){
        didSet{
            addMessageSubject.onNext(Void())
        }
    }
    var chattingmMembers = [ChattingMember]()
    
    let blockUserIndexSubject = PublishSubject<Int>()
    let declarationUserResponse = PublishSubject<ResponseState>()
    let addMessageSubject = PublishSubject<Void>()
    
    private let socket: SocketIOManager
    private let room: ChattingRoomResponseModel
    private let blockUserUseCase: BlockUserUseCaseInterface
    private let declarationUserUseCase: DeclarationUserUseCaseInterface
    private let exitRoomUseCase: ExitChattingRoomUseCaseInterface
    private let getChattingMemberListUseCase: GetMemberListOfChattingUseCaseInterface

    init(roomInformation: ChattingRoomResponseModel = ChattingRoomResponseModel(name: "", roomId: "", sessions: ChattingRoomResponseModel.Session()),
         blockUserUseCase: BlockUserUseCaseInterface = BlockUserUseCase(),
         declarationUserUseCase: DeclarationUserUseCaseInterface = DeclarationUserUseCase(),
         exitRoomUseCase: ExitChattingRoomUseCaseInterface = ExitChattingRoomUseCase(),
         getChattingMemberListUseCase: GetMemberListOfChattingUseCaseInterface = GetMemberListOfChattingUseCase()) {
        self.room = roomInformation
        self.socket = SocketIOManager()
        self.blockUserUseCase = blockUserUseCase
        self.declarationUserUseCase = declarationUserUseCase
        self.exitRoomUseCase = exitRoomUseCase
        self.getChattingMemberListUseCase = getChattingMemberListUseCase
        
        initialize()
    }
    
    private func initialize(){
        socket.delegate = self
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
        
        input.sendBtnTap
            .withLatestFrom(input.messageObservable)
            .do{
                self.messages.append(ChatMessage(nickname: UserManager.nickName!, message: $0, image: nil, chatType: .RightMessage))
            }.subscribe{
                self.socket.send(message: $0)
            }.disposed(by: disposeBag)
        
        let exitResponse = input.exitBtnTap
            .flatMap{
                self.exitRoomUseCase.execute(roomId: self.room.roomId)
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
            .execute(roomId: room.roomId)
            .subscribe{ [weak self] in
                if let members = $0 {
                    self?.chattingmMembers = members
                }
            }.disposed(by: disposeBag)
        
        let member = ChattingMember(userId: 1, name: "쑤야", profileImageUrl: "23")
        chattingmMembers = [ChattingMember](repeating: member, count: 3)
    }
    
    func declarationUser(index: Int, reason: Int){
        print(index, reason)
        declarationUserUseCase
            .execute(requestValue: DeclarationRequestModel(reason: reason, targetId: chattingmMembers[index].userId))
            .subscribe{ [weak self] in
                self?.declarationUserResponse.onNext($0)
            }.disposed(by: disposeBag)
    }
}

extension ChattingRoomViewModel{
    func receive(message: ChatMessage) {
        messages.append(message)
    }
    
    func closeChat() {
        socket.stop()
    }
}
