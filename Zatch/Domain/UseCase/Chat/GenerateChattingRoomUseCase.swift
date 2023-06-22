//
//  GenerateChattingRoomUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/06/22.
//

import Foundation
import RxSwift

struct GenerateChattingRoomRequestModel: Encodable{
    let name: String
}

protocol GenerateChattingRoomUseCaseInterface {
    func execute(requestModel: GenerateChattingRoomRequestModel) -> Observable<ChattingRoomResponseModel>
}

final class GenerateChattingRoomUseCase: GenerateChattingRoomUseCaseInterface {
    
    private let chatRepository: ChatRepositoryInterface
    
    init(chatRepository: ChatRepositoryInterface = ChatRepository()) {
        self.chatRepository = chatRepository
    }
    
    func execute(requestModel: GenerateChattingRoomRequestModel) -> Observable<ChattingRoomResponseModel> {
        return chatRepository.generateChattingRoom(requestModel: requestModel)
    }
}
