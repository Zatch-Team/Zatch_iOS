//
//  SheetInfo.swift
//  Zatch
//
//  Created by 박지윤 on 2022/11/14.
//

import Foundation

enum BottomSheetType{
    case SearchMyTag
    case SearchWantTag
    case Category
    case TownArea
    case Declaration
    case MakeMeeting
    case LocationChange
}

struct BottomSheetInfo{
    let title: String
    let sheetHeight: CGFloat
    let grabberVisibility: Bool = false
}

extension BottomSheetType{
    
    var info: BottomSheetInfo{
        switch self{
        case .SearchMyTag:      return BottomSheetInfo(title: "내가 등록한 재치", sheetHeight: 219)
        case .SearchWantTag:    return BottomSheetInfo(title: "내가 찾는 재치", sheetHeight: 219)
        case .Category:         return BottomSheetInfo(title: "카테고리", sheetHeight: 524)
        case .TownArea:         return BottomSheetInfo(title: "동네 범위 설정", sheetHeight: 442)
        case .Declaration:      return BottomSheetInfo(title: "", sheetHeight: 128)
        case .MakeMeeting:      return BottomSheetInfo(title: "주소검색", sheetHeight: 324)
        case .LocationChange:   return BottomSheetInfo(title: "내 동네 변경하기", sheetHeight: 216)
        }
    }
    
    var sheetHeight: CGFloat{
        return self.info.sheetHeight
    }
    
    var title: String?{
        return self.info.title
    }
    
    var grabberVisibility: Bool{
        return self.info.grabberVisibility
    }
    
}
