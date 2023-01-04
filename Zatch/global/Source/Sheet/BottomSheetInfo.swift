//
//  SheetInfo.swift
//  Zatch
//
//  Created by 박지윤 on 2022/11/14.
//

import Foundation

enum BottomSheetType{
    case searchMyTag
    case searchWantTag
    case category
    case townArea
    case declaration
    case makeMeeting
    case locationChange
    case detailEtc
}

struct BottomSheetInfo{
    let title: String?
    let sheetHeight: CGFloat
    let grabberVisibility: Bool = false
}

extension BottomSheetType{
    
    private var info: BottomSheetInfo{
        switch self{
        case .searchMyTag:      return BottomSheetInfo(title: "내가 등록한 재치", sheetHeight: 219)
        case .searchWantTag:    return BottomSheetInfo(title: "내가 찾는 재치", sheetHeight: 219)
        case .category:         return BottomSheetInfo(title: "카테고리", sheetHeight: 524)
        case .townArea:         return BottomSheetInfo(title: "동네 범위 설정", sheetHeight: 442)
        case .declaration:      return BottomSheetInfo(title: nil, sheetHeight: 128)
        case .makeMeeting:      return BottomSheetInfo(title: "주소검색", sheetHeight: 324)
        case .locationChange:   return BottomSheetInfo(title: "내 동네 변경하기", sheetHeight: 216)
        case .detailEtc:        return BottomSheetInfo(title: nil, sheetHeight: 132)
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
