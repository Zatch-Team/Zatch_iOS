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
    case Register
    case ImageDelete
    case RegisterCategory
    case ProductName
    case ImageMin
    case BuyDate
    case EndDate
    
    //Map
    case LocationAuthority
    case TownCertification
    
    //ChattingRoom
    case ChattingRoomExit
    case Block(user: String)
    case UnBlock
    case AlarmInfo
    
    //Question
    case QuestionCategory
    case QuestionTitle
    case QuestionContent
    case QuestionRegister
    
    //User
    case ChangeNickname
    case Logout
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
            
        case .Register:
            return CancelAlertViewController(message: "재치 등록을 완료하시겠습니까?", btnTitle: "등록 완료")
            
        case .ImageDelete:
            return CancelAlertViewController(message: "해당 이미지를 삭제하시겠습니까?")
            
        case .RegisterCategory:
            return BasicAlertViewController(message: "카테고리를 입력해주세요.")
        case .ProductName:
            return BasicAlertViewController(message: "상품 이름을 입력해주세요.")
        case .ImageMin:
            return BasicAlertViewController(message: "이미지를 최소 1장 이상 첨부해주세요.")
        case .BuyDate:
            return BasicAlertViewController(message: "구매일자를 입력해주세요.")
        case .EndDate:
            return BasicAlertViewController(message: "유통기한을 입력해주세요.")
            
        case .LocationAuthority: return InfoAlertViewController(message: "위치 권한을 허용하셔야 동네 인증이 가능합니다.")
            
        case .TownCertification:
            return InfoAlertViewController(message: "현 위치와 선택하신 동네가 다릅니다.")
            
        case .ChattingRoomExit: return CancelAlertViewController(message: "채팅방을 나가시겠습니까?\n채팅방을 나가면 채팅 내역은 복구되지 않습니다.", btnTitle: "네, 확인했습니다.")
        case .Block(let user):  return CancelAlertViewController(message: "\(user)님을 차단하시겠습니까?\n더 이상의 대화가 불가합니다.", btnTitle: "네, 차단합니다.")
        case .UnBlock:
            return CancelAlertViewController(message: "해당 사용자를 차단 해제하시겠습니까?", btnTitle: "해제")
        case .AlarmInfo:
            return InfoAlertViewController(message: "약속시간 30분 전에 자동으로 알림이 울립니다.")
            
        case .QuestionCategory:
            return InfoAlertViewController(message: "카테고리를 선택해주세요.")
        case .QuestionTitle:
            return InfoAlertViewController(message: "제목을 입력해주세요.")
        case .QuestionContent:
            return InfoAlertViewController(message: "내용을 입력해주세요.")
        case .QuestionRegister:
            return CancelAlertViewController(message: "1:1 문의를 정말 등록하시겠습니까?", btnTitle: "등록")
            
            
        case .ChangeNickname:
            return CancelAlertViewController(message: "닉네임을 변경하시면 30일 동안 추가 변경이 불가능합니다. 변경하시겠습니까?", btnTitle: "확인")
        case .Logout:
            return CancelAlertViewController(message: "로그아웃 하시겠습니까?", btnTitle: "로그아웃")
        }
    }
}
