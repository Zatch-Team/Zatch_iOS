//
//  ZatchRouter.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/11.
//

import Foundation
import Moya

enum ZatchRouter: BaseRouter{
    case likeZatch(requestValue: ZatchLikeRequestValue)
    case dislikeZatch(requestValue: ZatchLikeRequestValue)
    case registerZatch(requestModel: RegisterZatchRequestModel, images: [UIImage])
}

extension ZatchRouter{
    
    var path: String {
        switch self {
        case .likeZatch(let requestValue):          return HTTPMethodURL.POST.likeZatch + String(requestValue.zatchId) + "/likes"
        case .dislikeZatch(let requestValue):       return HTTPMethodURL.DELETE.dislikeZatch + String(requestValue.zatchId) + "/dislikes"
        case .registerZatch:                        return HTTPMethodURL.POST.zatch
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .likeZatch, .registerZatch:    return .post
        case .dislikeZatch:                 return .delete
        }
    }
    
    var task: Task {
        switch self {
        case .likeZatch, .dislikeZatch:                     return .requestPlain
        case .registerZatch(let request, let images):       return .uploadMultipart(getFormData(requestModel: request, images: images))
        }
    }
    
    private func getFormData(requestModel: RegisterZatchRequestModel, images: [UIImage]) -> [MultipartFormData]{
        var multiPartFormData = [MultipartFormData]()
        setExceptImages(requestModel, formData: &multiPartFormData)
        setImages(images, formData: &multiPartFormData)
        return multiPartFormData
    }
    
    private func setExceptImages(_ requestModel: RegisterZatchRequestModel, formData: inout [MultipartFormData]){
        guard let parameters = requestModel.toDictionary else { fatalError() }
        for (key, value) in parameters {
            formData.append(MultipartFormData(provider: .data("\(value)".data(using: .utf8)!),
                                              name: key))
        }
    }
    
    private func setImages(_ images: [UIImage], formData: inout [MultipartFormData]){
        for image in images {
            let imageData = image.jpegData(compressionQuality: 1.0)
            let multipartImage = MultipartFormData(provider: .data(imageData!),
                                                   name: "image",
                                                   fileName: "image",
                                                   mimeType: "image/jpeg")
            formData.append(multipartImage)
        }
    }
}

private extension Encodable{
    var toDictionary : [String: Any]? {
        guard let object = try? JSONEncoder().encode(self) else { return nil }
        guard let dictionary = try? JSONSerialization.jsonObject(with: object, options: []) as? [String:Any] else { return nil }
        return dictionary
    }
}


