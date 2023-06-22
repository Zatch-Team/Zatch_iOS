//
//  GetOpenedChattingRoomsUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/06/22.
//

import Foundation
import RxSwift

protocol GetOpenedChattingRoomsUseCaseInterface {
    func execute() -> Observable<[ChattingRoomResponseModel]>
}

final class GetOpenedChattingRoomsUseCase: GetOpenedChattingRoomsUseCaseInterface {
    
    private let chatRepository: ChatRepositoryInterface
    
    init(chatRepository: ChatRepositoryInterface = ChatRepository()) {
        self.chatRepository = chatRepository
    }
    
    func execute() -> Observable<[ChattingRoomResponseModel]> {
        return chatRepository.getOpenedChattingRooms()
    }
}
