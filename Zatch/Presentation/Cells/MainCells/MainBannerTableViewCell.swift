//
//  MainBannerTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/06.
//

import UIKit

class MainBannerTableViewCell: BaseTableViewCell {

    private let banner = UIImageView().then{
        $0.image = Image.MainBanner
        $0.contentMode = .scaleAspectFit
    }
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(banner)
    }
    
    override func layout() {
        super.layout()
        banner.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setBannerImage(_ image: UIImage){
        banner.image = image
    }
}
