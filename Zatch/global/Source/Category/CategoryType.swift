//
//  Category.swift
//  Zatch
//
//  Created by 박지윤 on 2022/11/13.
//

import Foundation

enum CategoryType{
    case Zatch
    case Gatch
}

struct CategoryInfo{
    let title: String
    let image: UIImage
}

extension CategoryType{
    
    var categoryInfoList: [CategoryInfo]{
        switch self{
        case .Zatch:    return [CategoryInfo(title: "음식", image: Image.category0)] + defaultCategories
        case .Gatch:    return [CategoryInfo(title: "음식|조리", image: Image.category0),
                                CategoryInfo(title: "음식|비조리", image: Image.category1)] + defaultCategories
        }
    }
    
    func getInfo(at: Int) -> CategoryInfo{
        return self.categoryInfoList[at]
    }
}

private let defaultCategories = [CategoryInfo(title: "생활용품", image: Image.category2),
                         CategoryInfo(title: "가구/인테리어", image: Image.category3),
                         CategoryInfo(title: "디지털기기", image: Image.category4),
                         CategoryInfo(title: "잡화", image: Image.category5),
                         CategoryInfo(title: "의류", image: Image.category6),
                         CategoryInfo(title: "뷰티/미용", image: Image.category7),
                         CategoryInfo(title: "도서/문구류", image: Image.category8),
                         CategoryInfo(title: "문화생활", image: Image.category9),
                         CategoryInfo(title: "게임/취미", image: Image.category10),
                         CategoryInfo(title: "스포츠/레저", image: Image.category11),
                         CategoryInfo(title: "반려동물", image: Image.category12),
                         CategoryInfo(title: "식물/원예", image: Image.category13),
                         CategoryInfo(title: "차량용품", image: Image.category14),
                         CategoryInfo(title: "기타물품", image: Image.category15)]
