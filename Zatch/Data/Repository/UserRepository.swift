//
//  UserRepository.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/18.
//

import Foundation
import RxSwift

final class UserRepository: UserRepositoryInterface {
    
    func login(requestModel: LoginRequestModel) -> Observable<LoginResponseModel?> {
        let observable = Observable<LoginResponseModel?>.create { observer -> Disposable in
            let requestReference: () = UserService.shared.login(request: requestModel){ response in
                switch response {
                case .success(let data):
                    observer.onNext(data)
                case .failure(let err):
                    print(err)
                    observer.onNext(nil)
                }
            }
            return Disposables.create(with: { requestReference })
        }
        return observable
    }

    func getMyTowns(){
        
    }
}
