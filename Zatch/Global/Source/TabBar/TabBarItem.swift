//
//  TabBarItem.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/24.
//

import Foundation

enum TabBarItem: Int, CaseIterable {
    case main
    case zatch
    case chatting
    case mypage
}

extension TabBarItem {
    private var icon: UIImage? {
        switch self {
        case .main:     return Image.home
        case .zatch:     return Image.zatchIcon
        case .chatting:     return Image.chat
        case .mypage:     return Image.profile
        }
    }
}

extension TabBarItem {
    public func asTabBarItem() -> UITabBarItem {
        return UITabBarItem(
            title: nil,
            image: icon?.withTintColor(.black85),
            selectedImage: icon?.withTintColor(.zatchPurple)
        )
    }
}
