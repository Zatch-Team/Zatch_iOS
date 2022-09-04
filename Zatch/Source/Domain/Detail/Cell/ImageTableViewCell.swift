//
//  ImageTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/26.
//

import UIKit

class DetailImageTableViewCell: BaseTableViewCell {
    
    let detailImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUpView()
        setUpConstriant()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        baseView.addSubview(detailImageView)
    }
    
    func setUpConstriant(){
        
        baseView.snp.makeConstraints{ make in
            make.height.equalTo(self.baseView.snp.width)
        }
        
        self.detailImageView.snp.makeConstraints{ make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }

}
