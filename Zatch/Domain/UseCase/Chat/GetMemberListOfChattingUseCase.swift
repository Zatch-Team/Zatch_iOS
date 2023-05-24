//
//  GetMemberListOfChattingUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/24.
//

import Foundation
import RxSwift

protocol GetMemberListOfChattingUseCaseInterface {
    func execute(roomId: String) -> Observable<[String]>
}

final class GetMemberListOfChattingUseCase: GetMemberListOfChattingUseCaseInterface {
    
    private let chatRepository: ChatRepositoryInterface
    
    init(chatRepository: ChatRepositoryInterface = ChatRepository()) {
        self.chatRepository = chatRepository
    }
    
    func execute(roomId: String) -> Observable<[String]> {
        return chatRepository.getChattingMembers(roomId: roomId)
    }
}
