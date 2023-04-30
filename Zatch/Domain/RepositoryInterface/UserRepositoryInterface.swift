//
//  UserRepositoryInterface.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/18.
//

import Foundation
import RxSwift

protocol UserRepositoryInterface{
    func login(requestModel: LoginRequestModel) -> Observable<LoginResponseModel?>
    func logout() -> Observable<Int>
    func registerTown(requestModel: RegisterTownRequestModel) -> Observable<Int>
    func getMyTowns()
}
