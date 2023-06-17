//
//  DeclarationUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/06/13.
//

import Foundation
import RxSwift

struct DeclarationRequestModel: Encodable{
    let reason: Int
    let targetId: Int
    let userId: Int = UserManager.userId!
    
    enum CodingKeys: String, CodingKey {
        case reason = "report_reason"
        case targetId = "reported_id"
        case userId = "reporter_id"
    }
}

protocol DeclarationUserUseCaseInterface {
    func execute(requestValue: DeclarationRequestModel) -> Observable<ResponseState>
}

final class DeclarationUserUseCase: DeclarationUserUseCaseInterface {
    
    private let chatRepository: ChatRepositoryInterface
    
    init(chatRepository: ChatRepositoryInterface = ChatRepository()) {
        self.chatRepository = chatRepository
    }
    
    func execute(requestValue: DeclarationRequestModel) -> Observable<ResponseState> {
        return chatRepository.declarationUser(requestModel: requestValue)
    }
}
