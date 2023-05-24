//
//  ExitChattingRoomUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/24.
//

import Foundation
import RxSwift

protocol ExitChattingRoomUseCaseInterface {
    func execute(roomId: String) -> Observable<ResponseState>
}

final class ExitChattingRoomUseCase: ExitChattingRoomUseCaseInterface {
    
    private let chatRepository: ChatRepositoryInterface
    
    init(chatRepository: ChatRepositoryInterface = ChatRepository()) {
        self.chatRepository = chatRepository
    }
    
    func execute(roomId: String) -> Observable<ResponseState> {
        return chatRepository.exitChattingRoom(roomId: roomId)
    }
}
