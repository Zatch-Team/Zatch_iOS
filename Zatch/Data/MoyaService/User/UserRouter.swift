//
//  UserRouter.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/29.
//

import Foundation
import Moya

enum UserRouter: BaseRouter{
    case login(requestModel: LoginRequestModel)
    case logout
    case registerTown(requestModel: RegisterTownRequestModel)
    case modifyProfile(requestModel: ModifyProfileRequestModel)
    case modifyProfileImage(request: UIImage)
}

extension UserRouter{
    
    var path: String {
        switch self {
        case .login:                return HTTPMethodURL.POST.login
        case .logout:               return HTTPMethodURL.GET.logout
        case .registerTown:         return HTTPMethodURL.POST.town + userIdPath + "/address"
        case .modifyProfile:       return HTTPMethodURL.PATCH.nickname + userIdPath + "/nickname"
        case .modifyProfileImage:   return HTTPMethodURL.PATCH.profileImage + userIdPath + "/patch_profile"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login, .registerTown:                 return .post
        case .logout:                               return .get
        case .modifyProfileImage, .modifyProfile:  return .patch
        }
    }
    
    var task: Task {
        switch self {
        case .login(let request):                   return .requestJSONEncodable(request)
        case .registerTown(let request):            return .requestJSONEncodable(request)
        case .modifyProfile(let request):          return .requestJSONEncodable(request)
        case .modifyProfileImage(let requestImage):
            let imageData = requestImage.jpegData(compressionQuality: 1.0)
            let multipartImage = MultipartFormData(provider: .data(imageData!),
                                                   name: "image",
                                                   fileName: "image",
                                                   mimeType: "image/jpeg")
            return .uploadMultipart([multipartImage])
        default:                                return .requestPlain
        }
    }
}


