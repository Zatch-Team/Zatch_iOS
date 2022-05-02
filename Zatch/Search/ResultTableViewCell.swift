//
//  ResultTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/02.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    let image = UIImageView()
    let myProduct = UILabel()
    let wantProduct = UILabel()
    let exchangeImage = UIImageView()
    let etcInfoText = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(image)
        self.contentView.addSubview(myProduct)
        self.contentView.addSubview(wantProduct)
        self.contentView.addSubview(exchangeImage)
        self.contentView.addSubview(etcInfoText)
        
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpConstraint(){
        self.contentView.snp.makeConstraints{ make in
            make.height.equalTo(138)
        }
    }

}
