//
//  AlertInfo.swift
//  Zatch
//
//  Created by 박지윤 on 2022/11/14.
//

import Foundation

enum Alert{
    //Register
    case ImageMax
    
    //Map
    case LocationAuthority
    case TownCertification
    
    //ChattingRoom
    case ChattingRoomExit
    case Block(user: String)
}

struct AlertDescription{
    var message: String
    var okButtonTitle: String?
    var cancelButtonTitle: String?
}

extension Alert{
    
    func generateAlert() -> AlertViewController{
        switch self{
        case .ImageMax:
            return BasicAlertViewController(message: "이미지는 최대 10장까지 등록 가능합니다.")
        case .LocationAuthority: return InfoAlertViewController(message: "위치 권한을 허용하셔야 동네 인증이 가능합니다.")
            
        case .TownCertification:
            return InfoAlertViewController(message: "현 위치와 선택하신 동네가 다릅니다.")
            
        case .ChattingRoomExit: return CancelAlertViewController(message: "채팅방을 나가시겠습니까?\n채팅방을 나가면 채팅 내역은 복구되지 않습니다.", btnTitle: "네, 확인했습니다.")
        case .Block(let user):  return CancelAlertViewController(message: "\(user)님을 차단하시겠습니까?\n더 이상의 대화가 불가합니다.", btnTitle: "네, 차단합니다.")
        }
    }
}
