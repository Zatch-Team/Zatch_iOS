//
//  ChattingRoomResponseModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/06/22.
//

import Foundation

struct ChattingRoomResponseModel: Decodable{
    
    let name: String
    let roomId: String
    let sessions: Session
    
    struct Session: Decodable{
        
    }
}
 
