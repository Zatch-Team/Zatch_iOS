//
//  ChattingRoomViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/23.
//

import Foundation
import RxSwift
import RxCocoa

protocol ChattingRoomViewModelInterface: BaseViewModel, BlockUserInterface{
    var messages: [ChatMessage] { get }
    func viewDidLoad()
}

protocol BlockUserInterface{
    var chattingmMembers: [ChattingMember] { get }
    var blockUserIndexSubject: PublishSubject<Int> { get }
    var blockUserResponse: PublishSubject<ResponseState> { get }
}

class ChattingRoomViewModel: ChattingRoomViewModelInterface{
    
    var messages = [ChatMessage]()
    var chattingmMembers = [ChattingMember]()
    
    let blockUserIndexSubject = PublishSubject<Int>()
    let blockUserResponse = PublishSubject<ResponseState>()
    
    private let blockUserUseCase: BlockUserUseCaseInterface
    private let exitRoomUseCase: ExitChattingRoomUseCaseInterface
    private let getChattingMemberListUseCase: GetMemberListOfChattingUseCaseInterface

    init(blockUserUseCase: BlockUserUseCaseInterface = BlockUserUseCase(),
         exitRoomUseCase: ExitChattingRoomUseCaseInterface = ExitChattingRoomUseCase(),
         getChattingMemberListUseCase: GetMemberListOfChattingUseCaseInterface = GetMemberListOfChattingUseCase()) {
        self.blockUserUseCase = blockUserUseCase
        self.exitRoomUseCase = exitRoomUseCase
        self.getChattingMemberListUseCase = getChattingMemberListUseCase
    }

    struct Input{
        let messageObservable: Observable<String>
        let sendBtnTap: ControlEvent<Void>
        let exitBtnTap: Observable<Void>
    }
    
    struct Output{
//        let canSendMessage: Driver<Bool>
//        let exitResponse: Observable<ResponseState>
    }
    
    func transform(_ input: Input) -> Output{
        Output()
    }
    
    func viewDidLoad() {
        //채팅방 멤버 조회
        
    }
}
