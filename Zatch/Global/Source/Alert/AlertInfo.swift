//
//  AlertInfo.swift
//  Zatch
//
//  Created by 박지윤 on 2022/11/14.
//

import Foundation

enum Alert{
    //Zatch
    case zatchDelete
    
    //Register
    case ImageMax
    case Register
    case ImageDelete
    case RegisterCategory
    case ProductName
    case ImageMin
    case BuyDate
    case EndDate
    case ChangeShare
    
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
    var confirmTitle: String? = "확인"
    var cancelTitle: String? = "취소"
}

extension Alert{
    
    private var information: AlertDescription{
        switch self{
        case .zatchDelete:          return AlertDescription(message: "해당 게시물을 삭제하시겠습니까?",
                                                            confirmTitle: "삭제")
            
        case .ImageMax:             return AlertDescription(message: "이미지는 최대 10장까지 등록 가능합니다.")
        case .Register:             return AlertDescription(message: "재치 등록을 완료하시겠습니까?",
                                                            confirmTitle: "등록 완료")
        case .ImageDelete:          return AlertDescription(message: "해당 이미지를 삭제하시겠습니까?")
        case .RegisterCategory:     return AlertDescription(message: "카테고리를 입력해주세요.")
        case .ProductName:          return AlertDescription(message: "상품 이름을 입력해주세요.")
        case .ImageMin:             return AlertDescription(message: "이미지를 최소 1장 이상 첨부해주세요.")
        case .BuyDate:              return AlertDescription(message: "구매일자를 입력해주세요.")
        case .EndDate:              return AlertDescription(message: "유통기한을 입력해주세요.")
        case .ChangeShare:          return AlertDescription(message: "받고 싶은 상품이 없는 경우 해당 재치가\n나눔으로 전환됩니다.")
            
        case .LocationAuthority:    return AlertDescription(message: "위치 권한을 허용하셔야 동네 인증이 가능합니다.")
        case .TownCertification:    return AlertDescription(message: "현 위치와 선택하신 동네가 다릅니다.")
            
        case .ChattingRoomExit:     return AlertDescription(message: "채팅방을 나가시겠습니까?\n채팅방을 나가면 채팅 내역은 복구되지 않습니다.",
                                                            confirmTitle: "네, 확인했습니다.")
        case .Block(let user):      return AlertDescription(message: "\(user)님을 차단하시겠습니까?\n더 이상의 대화가 불가합니다.",
                                                            confirmTitle: "네, 차단합니다.")
        case .UnBlock:              return AlertDescription(message: "해당 사용자를 차단 해제하시겠습니까?",
                                                            confirmTitle: "해제")
        case .AlarmInfo:            return AlertDescription(message: "약속시간 30분 전에 자동으로 알림이 울립니다.")
            
        case .QuestionCategory:     return AlertDescription(message: "카테고리를 선택해주세요.")
        case .QuestionTitle:        return AlertDescription(message: "제목을 입력해주세요.")
        case .QuestionContent:      return AlertDescription(message: "내용을 입력해주세요.")
        case .QuestionRegister:     return AlertDescription(message: "1:1 문의를 정말 등록하시겠습니까?",
                                                            confirmTitle: "등록")
            
            
        case .ChangeNickname:       return AlertDescription(message: "닉네임을 변경하시면 30일 동안 추가 변경이 불가능합니다. 변경하시겠습니까?",
                                                            confirmTitle: "확인")
        case .Logout:               return AlertDescription(message: "로그아웃 하시겠습니까?",
                                                            confirmTitle: "로그아웃")
        }
    }
    
    func getInstance() -> AlertViewController{
        switch self{
        case    .ImageMax,
                .RegisterCategory,
                .ProductName,
                .ImageMin,
                .BuyDate,
                .EndDate:               return BasicAlertViewController(message: information.message)
            
        case    .LocationAuthority,
                .TownCertification,
                .AlarmInfo,
                .QuestionCategory,
                .QuestionTitle,
                .QuestionContent:       return InfoAlertViewController(message: information.message)
            
        case    .zatchDelete,
                .ChangeShare,
                .ChattingRoomExit,
                .UnBlock,
                .Register,
                .ImageDelete,
                .QuestionRegister,
                .ChangeNickname,
                .Block,
                .Logout:                return CancelAlertViewController(message: information.message,
                                                                         confirmTitle: information.confirmTitle,
                                                                         cancelTitle: information.cancelTitle)
        }
    }
    
    @discardableResult
    func show(in viewController: UIViewController) -> AlertViewController{
        self.getInstance().show(in: viewController)
    }
}
