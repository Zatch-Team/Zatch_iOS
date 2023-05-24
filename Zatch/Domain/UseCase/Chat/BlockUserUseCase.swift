//
//  BlockUserUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/23.
//

import Foundation
import RxSwift

struct BlockUserRequestModel: Encodable{
    let blockedUserId: Int
    let userId: Int
    
    enum CodingKeys: String, CodingKey {
        case blockedUserId = "blocked_id"
        case userId = "blocker_id"
    }
}

protocol BlockUserUseCaseInterface {
    func execute(requestValue: BlockUserRequestModel) -> Observable<ResponseState>
}

final class BlockUserUseCase: BlockUserUseCaseInterface {
    
    private let chatRepository: ChatRepositoryInterface
    
    init(chatRepository: ChatRepositoryInterface = ChatRepository()) {
        self.chatRepository = chatRepository
    }
    
    func execute(requestValue: BlockUserRequestModel) -> Observable<ResponseState> {
        return chatRepository.blockUser(requestModel: requestValue)
    }
}
