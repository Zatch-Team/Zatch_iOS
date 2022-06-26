//
//  ImageTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/26.
//

import UIKit

class DetailImageTableViewCell: UITableViewCell {
    
    let detailImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUpView()
        setUpConstriant()
        setUpValue()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        self.contentView.addSubview(detailImageView)
    }
    
    func setUpConstriant(){
        self.contentView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(self.contentView.snp.width)
        }
        
        self.detailImageView.snp.makeConstraints{ make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func setUpValue(){
        
    }

}
