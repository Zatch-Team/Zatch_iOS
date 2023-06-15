//
//  ChatRepository.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/23.
//

import Foundation
import RxSwift

final class ChatRepository: ChatRepositoryInterface {

    func getChattingRooms() -> Observable<[String]?> {
        let observable = Observable<[String]?>.create { observer -> Disposable in
            let requestReference: () = ChatService.shared.getChattingRoomList{ response in
                switch response {
                case .success(let data):
                    observer.onNext(data)
                case .failure:
                    observer.onNext(nil)
                }
            }
            return Disposables.create(with: { requestReference })
        }
        return observable
    }
    
    
    func blockUser(requestModel: BlockUserRequestModel) -> Observable<ResponseState> {
        let observable = Observable<ResponseState>.create { observer -> Disposable in
            let requestReference: () = ChatService.shared.blockUser(requestModel: requestModel){ response in
                switch response {
                case .success:
                    observer.onNext(.success)
                case .failure:
                    observer.onNext(.fail)
                }
            }
            return Disposables.create(with: { requestReference })
        }
        return observable
    }

    func getChattingMembers(roomId: String) -> Observable<[ChattingMember]?> {
        let observable = Observable<[ChattingMember]?>.create { observer -> Disposable in
            let requestReference: () = ChatService.shared.getChattingRoomMemberList(roomId: roomId){ response in
                switch response {
                case .success(let data):
                    observer.onNext(data.map{ $0.toDomain() })
                case .failure:
                    observer.onNext(nil)
                }
            }
            return Disposables.create(with: { requestReference })
        }
        return observable
    }

    func exitChattingRoom(roomId: String) -> Observable<ResponseState> {
        let observable = Observable<ResponseState>.create { observer -> Disposable in
            let requestReference: () = ChatService.shared.exitChattingRoom(roomId: roomId) { response in
                switch response {
                case .success:
                    observer.onNext(.success)
                case .failure:
                    observer.onNext(.fail)
                }
            }
            return Disposables.create(with: { requestReference })
        }
        return observable
    }
    
    func declarationUser(requestModel: DeclarationRequestModel) -> Observable<ResponseState> {
        let observable = Observable<ResponseState>.create { observer -> Disposable in
            let requestReference: () = ChatService.shared.declarationUser(requestModel: requestModel){ response in
                switch response {
                case .success:
                    observer.onNext(.success)
                case .failure:
                    observer.onNext(.fail)
                }
            }
            return Disposables.create(with: { requestReference })
        }
        return observable
    }
}
