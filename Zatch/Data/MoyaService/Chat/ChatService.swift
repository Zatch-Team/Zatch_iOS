//
//  ChatService.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/23.
//

import Foundation

public class ChatService {
    
    static let shared = ChatService()
    let provider = BaseService(plugins: [MoyaLoggerPlugin()])
    
    private init() { }
    
    func generateChattingRoom(requestModel: GenerateChattingRoomRequestModel, completion: @escaping (Result<BaseResponseModel<ChattingRoomResponseModel>, Error>) -> Void){
        provider.requestDecoded(ChatRouter.generateRoom(requestModel: requestModel)){ response in
            completion(response)
        }
    }
    
    func getOpenedChatRooms(completion: @escaping (Result<BaseResponseModel<[ChattingRoomResponseModel]>, Error>) -> Void){
        provider.requestDecoded(ChatRouter.openRooms){ response in
            completion(response)
        }
    }
    
    func getChattingRoomMemberList(roomId: String, completion: @escaping (Result<[ChattingMemberResponseDTO], Error>) -> Void){
        provider.requestDecoded(ChatRouter.getChattingMembers(roomId: roomId)){ response in
            completion(response)
        }
    }
    
    func getChattingRoomList(completion: @escaping (Result<[String], Error>) -> Void){
        provider.requestDecoded(ChatRouter.getRooms){ response in
            completion(response)
        }
    }
    
    func exitChattingRoom(roomId: String, completion: @escaping (Result<BaseResponseModel<Int>, Error>) -> Void){
        provider.requestDecoded(ChatRouter.exitRoom(roomId: roomId)){ response in
            completion(response)
        }
    }
    
    func blockUser(requestModel: BlockUserRequestModel, completion: @escaping (Result<BaseResponseModel<Int>, Error>) -> Void){
        provider.requestDecoded(ChatRouter.blockUser(requestModel: requestModel)){ response in
            completion(response)
        }
    }
    
    func declarationUser(requestModel: DeclarationRequestModel, completion: @escaping (Result<BaseResponseModel<Int>, Error>) -> Void){
        provider.requestDecoded(ChatRouter.declarationUser(requestModel: requestModel)){ response in
            completion(response)
        }
    }
}
