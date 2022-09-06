//
//  MainBannerTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/06.
//

import UIKit

class MainBannerTableViewCell: UITableViewCell {

    // Main Banner
    let banner = UIImageView().then{
        $0.image = UIImage(named: "MainBanner")
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpView() {
        addSubview(banner)
        
        banner.snp.makeConstraints{ make in
            make.width.height.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
