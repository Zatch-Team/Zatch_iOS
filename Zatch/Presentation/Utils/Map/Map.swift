//
//  Map.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/26.
//

import Foundation

protocol Map{
    func willMovePreviousViewController()
    func showAlertAboutLocation(location: String)
}

protocol MapLocationSelectable{
    func changeLocationMarker(x: Double, y: Double)
}
