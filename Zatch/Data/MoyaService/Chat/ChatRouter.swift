//
//  ChatRouter.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/23.
//

import Foundation
import Moya

enum ChatRouter: BaseRouter{
    case openRooms
    case generateRoom(requestModel: GenerateChattingRoomRequestModel)
    case getRooms
    case getChattingMembers(roomId: String)
    case exitRoom(roomId: String)
    case blockUser(requestModel: BlockUserRequestModel)
    case declarationUser(requestModel: DeclarationRequestModel)
}

extension ChatRouter{

    var path: String {
        switch self {
        case .openRooms:                            return HTTPMethodURL.GET.openChatRoom
        case .generateRoom:                         return HTTPMethodURL.POST.generateChatRoom
        case .getRooms:                             return HTTPMethodURL.GET.existChattingRoom + userIdPath
        case .getChattingMembers(let roomId):       return HTTPMethodURL.GET.chattingRoomMemebers + userIdPath + "/\(roomId)" + "/profile"
        case .exitRoom(let roomId):                 return HTTPMethodURL.GET.exitChattingRoom + userIdPath + "/\(roomId)"
        case .blockUser:                            return HTTPMethodURL.POST.block
        case .declarationUser:                      return HTTPMethodURL.POST.report
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .openRooms, .getRooms, .getChattingMembers, .exitRoom:     return .get
        case .blockUser, .declarationUser, .generateRoom:                              return .post
        }
    }
    
    var task: Task {
        switch self {
        case .generateRoom(let name):                   return .requestJSONEncodable(name)
        case .blockUser(let requestModel):              return .requestJSONEncodable(requestModel)
        case .declarationUser(let requestModel):        return .requestJSONEncodable(requestModel)
        default:                                        return .requestPlain
        }
    }
}



