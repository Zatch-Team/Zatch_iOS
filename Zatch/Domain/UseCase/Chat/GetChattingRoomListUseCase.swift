//
//  GetChattingRoomListUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/24.
//

import Foundation
import RxSwift

protocol GetChattingRoomListUseCaseInterface {
    func execute() -> Observable<[String]>
}

final class GetChattingRoomListUseCase: GetChattingRoomListUseCaseInterface {
    
    private let chatRepository: ChatRepositoryInterface
    
    init(chatRepository: ChatRepositoryInterface = ChatRepository()) {
        self.chatRepository = chatRepository
    }
    
    func execute() -> Observable<[String]> {
        return chatRepository.getChattingRooms()
    }
}
