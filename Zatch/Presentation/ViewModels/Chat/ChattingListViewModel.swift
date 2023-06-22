//
//  ChattingListViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/06/22.
//

import Foundation
import RxSwift

protocol OpenedChattingRoomsInterface{
    var reloadTableView: PublishSubject<Void> { get }
    var chattingRooms: [ChattingRoomResponseModel] { get }
    func reloadChattingRooms()
}

class ChattingListViewModel: BaseViewModel, OpenedChattingRoomsInterface{
    
    struct Input{
        
    }
    
    struct Output{
        
    }
    
    
    var chattingRooms: [ChattingRoomResponseModel] = [ChattingRoomResponseModel]()
    
    let reloadTableView: PublishSubject<Void> = PublishSubject()
    
    private let getOpenedRoomsUseCaseInterface: GetOpenedChattingRoomsUseCaseInterface
    
    
    init(getOpenedRoomsUseCaseInterface: GetOpenedChattingRoomsUseCaseInterface = GetOpenedChattingRoomsUseCase()){
        self.getOpenedRoomsUseCaseInterface = getOpenedRoomsUseCaseInterface
    }
    
    private let disposeBag = DisposeBag()
    
    func transform(_ input: Input) -> Output {
        Output()
    }
    
    func reloadChattingRooms() {
        getOpenedRoomsUseCaseInterface.execute()
            .subscribe{
                self.chattingRooms = $0
                self.reloadTableView.onNext(Void())
            }.disposed(by: disposeBag)
    }
}
 
