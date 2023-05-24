//
//  ChatRouter.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/23.
//

import Foundation
import Moya

enum ChatRouter: BaseRouter{
    case getRooms
    case getChattingMembers(roomId: String)
    case exitRoom(roomId: String)
    case blockUser(requestModel: BlockUserRequestModel)
}

extension ChatRouter{

    var path: String {
        switch self {
        case .getRooms:                             return HTTPMethodURL.GET.existChattingRoom + userIdPath
        case .getChattingMembers(let roomId):       return HTTPMethodURL.GET.chattingRoomMemebers + userIdPath + "/\(roomId)" + "/profile"
        case .exitRoom(let roomId):                 return HTTPMethodURL.GET.exitChattingRoom + userIdPath + "/\(roomId)"
        case .blockUser:                            return HTTPMethodURL.POST.block
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getRooms:
            return .get
        case .getChattingMembers:
            return .get
        case .exitRoom:
            return .get
        case .blockUser:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .blockUser(let requestModel):      return .requestJSONEncodable(requestModel)
        default:                                return .requestPlain
        }
    }
}



