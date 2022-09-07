//
//  SearchAddressResultTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/06.
//

import UIKit

class SearchAddressResultTableViewCell: BaseTableViewCell {
    
    static let cellIdentifier = "SearchAddressResultTableViewCell"
    
    let addressFrame = UIStackView().then{
        $0.spacing = 4
        $0.axis = .vertical
    }

    let locationLabel = UILabel().then{
        $0.text = "홍은두산위브아파트"
        $0.font = UIFont.pretendard(size: 15, family: .Bold)
        $0.textColor = .black85
        $0.numberOfLines = 1
    }
    
    let addressLabel = UILabel().then{
        $0.text = "서울 서대문구 모래내로 309 홍은두산위브아파트"
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textColor = .black85
        $0.numberOfLines = 1
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchAddressResultTableViewCell{
    
    func setUpView(){
        
        super.selectedBackgroundView?.backgroundColor = .black20
        
        self.baseView.addSubview(addressFrame)
        
        self.addressFrame.addArrangedSubview(locationLabel)
        self.addressFrame.addArrangedSubview(addressLabel)
    }
    
    func setUpConstraint(){
        
        baseView.snp.makeConstraints{
            $0.height.equalTo(70)
        }
        
        addressFrame.snp.makeConstraints{ make in
            make.top.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
}
