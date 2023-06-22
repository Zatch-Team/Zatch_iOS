//
//  ChatRepositoryInterface.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/23.
//

import Foundation
import RxSwift

protocol ChatRepositoryInterface{
    func generateChattingRoom(requestModel: GenerateChattingRoomRequestModel) -> Observable<ChattingRoomResponseModel?>
    func getOpenedChattingRooms() -> Observable<[ChattingRoomResponseModel]?>
    func blockUser(requestModel: BlockUserRequestModel) -> Observable<ResponseState>
    func getChattingMembers(roomId: String) -> Observable<[ChattingMember]?>
    func getChattingRooms() -> Observable<[String]?>
    func exitChattingRoom(roomId: String) -> Observable<ResponseState>
    func declarationUser(requestModel: DeclarationRequestModel) -> Observable<ResponseState>
}

