//
//  UIImageView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/06.
//

import UIKit

extension UIImageView {

func setImageTintColor(_ color: UIColor) {
    let tintedImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = tintedImage
    self.tintColor = color
  }
}
